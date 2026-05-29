#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

version="${1:-dev}"
package_name="Diabolical-${version}.zip"
out_dir="dist"
out_path="${out_dir}/${package_name}"

command -v zip >/dev/null 2>&1 || {
  printf 'package: error: zip is required\n' >&2
  exit 1
}

command -v unzip >/dev/null 2>&1 || {
  printf 'package: error: unzip is required for package verification\n' >&2
  exit 1
}

scripts/validate.sh

mkdir -p "$out_dir"
rm -f "$out_path"

zip -q -r "$out_path" \
  pack.mcmeta \
  data \
  README.md \
  CHANGELOG.md \
  LICENSE \
  docs \
  -x '*/.DS_Store'

mapfile -t zip_entries < <(unzip -Z1 "$out_path")

has_entry() {
  local expected="$1"
  local entry

  for entry in "${zip_entries[@]}"; do
    if [[ "$entry" == "$expected" ]]; then
      return 0
    fi
  done

  return 1
}

has_entry "pack.mcmeta" || {
  printf 'package: error: pack.mcmeta is missing from zip root\n' >&2
  exit 1
}

has_entry "data/minecraft/tags/function/load.json" || {
  printf 'package: error: data directory is missing from zip root\n' >&2
  exit 1
}

if printf '%s\n' "${zip_entries[@]}" | grep -Eq '^[^/]+/pack\.mcmeta$'; then
  printf 'package: error: zip contains a nested pack.mcmeta; package the data pack root directly\n' >&2
  exit 1
fi

printf 'package: created %s\n' "$out_path"
