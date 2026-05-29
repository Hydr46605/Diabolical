#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

version="${1:-dev}"
package_name="Diabolical-optional-resources-${version}.zip"
out_dir="dist"
out_path="${out_dir}/${package_name}"
resource_root="resourcepacks/diabolical_optional_resources"

command -v zip >/dev/null 2>&1 || {
  printf 'package-resourcepack: error: zip is required\n' >&2
  exit 1
}

command -v unzip >/dev/null 2>&1 || {
  printf 'package-resourcepack: error: unzip is required for package verification\n' >&2
  exit 1
}

scripts/validate.sh

[[ -f "${resource_root}/pack.mcmeta" ]] || {
  printf 'package-resourcepack: error: missing %s/pack.mcmeta\n' "$resource_root" >&2
  exit 1
}

mkdir -p "$out_dir"
rm -f "$out_path"

(
  cd "$resource_root"
  zip -q -r "${repo_root}/${out_path}" \
    pack.mcmeta \
    assets \
    -x '*/.DS_Store'
)

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
  printf 'package-resourcepack: error: pack.mcmeta is missing from zip root\n' >&2
  exit 1
}

has_entry "assets/diabolical/items/infernal_ledger.json" || {
  printf 'package-resourcepack: error: assets directory is missing from zip root\n' >&2
  exit 1
}

has_entry "assets/diabolical/items/black_writ.json" || {
  printf 'package-resourcepack: error: court item visuals are missing from zip root\n' >&2
  exit 1
}

if printf '%s\n' "${zip_entries[@]}" | grep -Eq '^[^/]+/pack\.mcmeta$'; then
  printf 'package-resourcepack: error: zip contains a nested pack.mcmeta; package the resource pack root directly\n' >&2
  exit 1
fi

printf 'package-resourcepack: created %s\n' "$out_path"
