#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

paper_version="${PAPER_SMOKE_PAPER_VERSION:-1.21.11}"
paper_build="${PAPER_SMOKE_PAPER_BUILD:-69}"
paper_sha256="${PAPER_SMOKE_PAPER_SHA256:-cf374f2af9d71dfcc75343f37b722a7abcb091c574131b95e3b13c6fc2cb8fae}"
paper_jar="${PAPER_SMOKE_PAPER_JAR:-}"
mojang_jar="${PAPER_SMOKE_MOJANG_JAR:-}"
keep="${PAPER_SMOKE_KEEP:-0}"
timeout_seconds="${PAPER_SMOKE_TIMEOUT:-300}"
version=""

usage() {
  cat <<'EOF'
Usage: scripts/paper_smoke.sh VERSION [options]

Builds the data pack, boots a disposable Paper server, verifies that the
Diabolical data pack loads, checks balance profile gates, tests reload
persistence, scans the server log for command/runtime errors, and stops cleanly.

Options:
  --paper-jar PATH    Use an existing Paper jar instead of downloading one.
  --mojang-jar PATH   Seed Paperclip's cache with an existing mojang_VERSION.jar.
  --keep             Keep the temporary smoke directory after the run.
  -h, --help         Show this help.

Environment overrides:
  PAPER_SMOKE_PAPER_VERSION  Paper/Minecraft version, default 1.21.11.
  PAPER_SMOKE_PAPER_BUILD    Paper build number, default 69.
  PAPER_SMOKE_PAPER_SHA256   Expected Paper jar SHA-256 for downloaded jars.
  PAPER_SMOKE_TIMEOUT        Boot timeout in seconds, default 300.

Example:
  scripts/paper_smoke.sh 0.5.0-dev
EOF
}

fail() {
  printf 'paper-smoke: error: %s\n' "$*" >&2
  exit 1
}

note() {
  printf 'paper-smoke: %s\n' "$*"
}

while (($#)); do
  case "$1" in
    --paper-jar)
      [[ $# -ge 2 ]] || fail "--paper-jar requires a path"
      paper_jar="$2"
      shift 2
      ;;
    --mojang-jar)
      [[ $# -ge 2 ]] || fail "--mojang-jar requires a path"
      mojang_jar="$2"
      shift 2
      ;;
    --keep)
      keep=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    -*)
      fail "unknown option: $1"
      ;;
    *)
      [[ -z "$version" ]] || fail "unexpected extra argument: $1"
      version="$1"
      shift
      ;;
  esac
done

[[ -n "$version" ]] || {
  usage >&2
  fail "missing version"
}

command -v java >/dev/null 2>&1 || fail "java is required"
command -v curl >/dev/null 2>&1 || fail "curl is required"
command -v sha256sum >/dev/null 2>&1 || fail "sha256sum is required"

[[ "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+(-[0-9A-Za-z.-]+)?$ ]] || fail "version must look like SemVer, without the leading v: $version"
[[ "$timeout_seconds" =~ ^[0-9]+$ ]] || fail "PAPER_SMOKE_TIMEOUT must be a positive integer"
((timeout_seconds > 0)) || fail "PAPER_SMOKE_TIMEOUT must be greater than zero"

scripts/package.sh "$version"

data_pack="dist/Diabolical-${version}.zip"
[[ -s "$data_pack" ]] || fail "missing built data pack: $data_pack"

work_dir="$(mktemp -d "${TMPDIR:-/tmp}/diabolical-paper-smoke.XXXXXX")"
server_log="${work_dir}/server-console.log"
server_stdin=""
server_stdout=""
reader_pid=""
server_pid=""

cleanup() {
  local status=$?

  if [[ -n "$server_pid" ]] && kill -0 "$server_pid" >/dev/null 2>&1; then
    note "stopping Paper server"
    if [[ -n "$server_stdin" ]]; then
      printf 'stop\n' >&${server_stdin} || true
    fi
    wait "$server_pid" || true
  fi

  if [[ -n "$reader_pid" ]]; then
    wait "$reader_pid" >/dev/null 2>&1 || true
  fi

  if [[ "$keep" != "1" ]]; then
    rm -rf "$work_dir"
  else
    note "kept smoke directory: $work_dir"
  fi

  exit "$status"
}
trap cleanup EXIT

mkdir -p "${work_dir}/world/datapacks" "${work_dir}/cache"
cp "$data_pack" "${work_dir}/world/datapacks/"

cat > "${work_dir}/eula.txt" <<'EOF'
eula=true
EOF

server_port="$((25570 + RANDOM % 1000))"
cat > "${work_dir}/server.properties" <<EOF
level-name=world
gamemode=survival
difficulty=normal
enable-command-block=true
online-mode=false
spawn-protection=0
view-distance=4
simulation-distance=4
max-players=2
max-tick-time=-1
server-port=${server_port}
motd=Diabolical smoke test
EOF

if [[ -n "$paper_jar" ]]; then
  [[ -f "$paper_jar" ]] || fail "Paper jar not found: $paper_jar"
  cp "$paper_jar" "${work_dir}/server.jar"
else
  cache_root="${XDG_CACHE_HOME:-${HOME}/.cache}/diabolical"
  cached_paper="${cache_root}/paper-${paper_version}-${paper_build}.jar"
  mkdir -p "$cache_root"

  if [[ ! -s "$cached_paper" ]]; then
    note "downloading Paper ${paper_version} build ${paper_build}"
    curl -fsSLo "$cached_paper" "https://api.papermc.io/v2/projects/paper/versions/${paper_version}/builds/${paper_build}/downloads/paper-${paper_version}-${paper_build}.jar"
  fi

  printf '%s  %s\n' "$paper_sha256" "$cached_paper" | sha256sum -c - >/dev/null || fail "Paper jar checksum mismatch: $cached_paper"
  cp "$cached_paper" "${work_dir}/server.jar"
fi

if [[ -n "$mojang_jar" ]]; then
  [[ -f "$mojang_jar" ]] || fail "Mojang server jar not found: $mojang_jar"
  cp "$mojang_jar" "${work_dir}/cache/mojang_${paper_version}.jar"
fi

start_server() {
  note "starting Paper smoke server in ${work_dir}"
  coproc MC_SERVER {
    cd "$work_dir"
    java -Ddisable.watchdog=true -Xms1G -Xmx1G -jar server.jar nogui
  }

  server_pid="$MC_SERVER_PID"
  exec {server_stdin}>&${MC_SERVER[1]}
  exec {server_stdout}<&${MC_SERVER[0]}
  exec {MC_SERVER[1]}>&-
  exec {MC_SERVER[0]}<&-

  {
    while IFS= read -r line <&${server_stdout}; do
      printf '%s\n' "$line" | tee -a "$server_log"
    done
  } &
  reader_pid="$!"
}

wait_for_log() {
  local pattern="$1"
  local seconds="$2"
  local elapsed=0

  while ((elapsed < seconds)); do
    if [[ -f "$server_log" ]] && grep -Fq "$pattern" "$server_log"; then
      return 0
    fi
    sleep 1
    elapsed=$((elapsed + 1))
  done

  return 1
}

send_command() {
  local command="$1"
  printf '%s\n' "$command" >&${server_stdin}
}

expect_log() {
  local pattern="$1"
  local seconds="${2:-20}"

  wait_for_log "$pattern" "$seconds" || fail "timed out waiting for log pattern: $pattern"
}

start_server
expect_log "Done (" "$timeout_seconds"

send_command "datapack list enabled"
expect_log "file/Diabolical-${version}.zip"

send_command "data get storage diabolical:contracts active_ids"
expect_log "blood_tithe"
expect_log "ashen_credit"
expect_log "grave_collateral"

send_command "function diabolical:config/profile/apply/calm"
send_command "scoreboard players get #profile diab.config"
send_command "scoreboard players get #collector.target_debt diab.event"
send_command "scoreboard players get #court.accuser_sin diab.mob"
expect_log "#profile has 0 [diab.config]"
expect_log "#collector.target_debt has 70 [diab.event]"
expect_log "#court.accuser_sin has 220 [diab.mob]"

send_command "function diabolical:config/profile/apply/hard"
send_command "scoreboard players get #profile diab.config"
send_command "scoreboard players get #collector.target_debt diab.event"
send_command "scoreboard players get #court.accuser_sin diab.mob"
expect_log "#profile has 2 [diab.config]"
expect_log "#collector.target_debt has 40 [diab.event]"
expect_log "#court.accuser_sin has 120 [diab.mob]"

send_command "reload"
sleep 8
send_command "scoreboard players get #profile diab.config"
expect_log "#profile has 2 [diab.config]"

send_command "function diabolical:config/profile/default"
send_command "scoreboard players get #profile diab.config"
send_command "scoreboard players get #collector.target_debt diab.event"
send_command "scoreboard players get #court.accuser_sin diab.mob"
expect_log "#profile has 1 [diab.config]"
expect_log "#collector.target_debt has 50 [diab.event]"
expect_log "#court.accuser_sin has 150 [diab.mob]"

send_command "stop"
expect_log "Stopping the server" 30
exec {server_stdin}>&- || true
wait "$server_pid"
server_pid=""
wait "$reader_pid" >/dev/null 2>&1 || true
reader_pid=""
exec {server_stdout}<&- || true

if grep -E 'ERROR|Exception|Unknown function|No such function|Unknown or incomplete command|Failed to|Cannot invoke|Invalid command' "$server_log" >/dev/null; then
  grep -En 'ERROR|Exception|Unknown function|No such function|Unknown or incomplete command|Failed to|Cannot invoke|Invalid command' "$server_log" >&2
  fail "server log contains runtime errors"
fi

note "ok"
