#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

usage() {
  cat <<'EOF'
Usage: scripts/release.sh VERSION

Runs the release preflight and builds both distributable zips.

Example:
  scripts/release.sh 0.4.2-rc1
EOF
}

fail() {
  printf 'release: error: %s\n' "$*" >&2
  exit 1
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

version="${1:-}"
[[ -n "$version" ]] || {
  usage >&2
  fail "missing version"
}

[[ "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+(-[0-9A-Za-z.-]+)?$ ]] || fail "version must look like SemVer, without the leading v: $version"
tag="v${version}"

[[ -f CHANGELOG.md ]] || fail "missing CHANGELOG.md"
grep -Fq "## ${version}" CHANGELOG.md || fail "CHANGELOG.md is missing section: ## ${version}"
grep -Fq "version:\"${version}\"" data/diabolical/function/config/defaults.mcfunction || fail "runtime config version does not match ${version}"

scripts/validate.sh
git diff --check
bash -n scripts/validate.sh scripts/package.sh scripts/package_resourcepack.sh scripts/paper_smoke.sh scripts/release.sh

scripts/package.sh "$version"
scripts/package_resourcepack.sh "$version"

data_pack="dist/Diabolical-${version}.zip"
resource_pack="dist/Diabolical-optional-resources-${version}.zip"
[[ -s "$data_pack" ]] || fail "missing built data pack: $data_pack"
[[ -s "$resource_pack" ]] || fail "missing built optional resource pack: $resource_pack"

printf 'release: ready for %s (%s)\n' "$version" "$tag"
printf 'release: data pack: %s\n' "$data_pack"
printf 'release: optional resource pack: %s\n' "$resource_pack"
