#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

fail() {
  printf 'validate: error: %s\n' "$*" >&2
  exit 1
}

note() {
  printf 'validate: %s\n' "$*"
}

check_png() {
  local file="$1"

  [[ -f "$file" ]] || fail "missing PNG: $file"
  [[ "$(od -An -tx1 -N8 "$file" | tr -d ' \n')" == "89504e470d0a1a0a" ]] || fail "not a PNG: $file"
}

check_png_size() {
  local file="$1"
  local width="$2"
  local height="$3"

  check_png "$file"
  python3 - "$file" "$width" "$height" <<'PY' || fail "bad PNG dimensions: $file"
import struct
import sys

path, expected_width, expected_height = sys.argv[1], int(sys.argv[2]), int(sys.argv[3])
with open(path, "rb") as handle:
    handle.seek(16)
    width, height = struct.unpack(">II", handle.read(8))

if (width, height) != (expected_width, expected_height):
    raise SystemExit(f"{path}: expected {expected_width}x{expected_height}, got {width}x{height}")
PY
}

command -v jq >/dev/null 2>&1 || fail "jq is required"
command -v gzip >/dev/null 2>&1 || fail "gzip is required"
command -v python3 >/dev/null 2>&1 || fail "python3 is required"

[[ -f pack.mcmeta ]] || fail "missing pack.mcmeta"
[[ -f LICENSE ]] || fail "missing LICENSE"
[[ -d data ]] || fail "missing data directory"
[[ -f data/minecraft/tags/function/load.json ]] || fail "missing load function tag"
[[ -f data/minecraft/tags/function/tick.json ]] || fail "missing tick function tag"
[[ -f README.md ]] || fail "missing README"
[[ -f CHANGELOG.md ]] || fail "missing changelog"
[[ -f docs/README.md ]] || fail "missing public docs index"
[[ -f docs/getting-started.md ]] || fail "missing getting started guide"
[[ -f docs/guides/server-admin.md ]] || fail "missing server guide"
[[ -f docs/guides/sinbound-court.md ]] || fail "missing Sinbound Court guide"
[[ -f docs/guides/optional-resource-pack.md ]] || fail "missing optional resource pack guide"
[[ -f docs/guides/structures.md ]] || fail "missing structures guide"
[[ -f docs/guides/releasing.md ]] || fail "missing releasing guide"
[[ -f docs/assets/diabolical-logo.png ]] || fail "missing README logo asset"
[[ -f docs/assets/diabolical-items-preview.png ]] || fail "missing resource-pack preview asset"
[[ -f resourcepacks/diabolical_optional_resources/pack.mcmeta ]] || fail "missing optional resource pack metadata"
[[ -f .github/workflows/ci.yml ]] || fail "missing CI workflow"
[[ -f .github/workflows/release.yml ]] || fail "missing release workflow"
[[ -f .github/release.yml ]] || fail "missing GitHub release notes configuration"
[[ -x scripts/release.sh ]] || fail "scripts/release.sh must be executable"

note "checking public docs surface"
for private_docs_dir in docs/content docs/design docs/ideas docs/implementation docs/reference docs/release docs/testing; do
  [[ ! -e "$private_docs_dir" ]] || fail "internal docs must not be tracked publicly: $private_docs_dir"
done

while IFS= read -r -d '' file; do
  case "$file" in
    docs/README.md|docs/getting-started.md|docs/guides/*.md) ;;
    *) fail "public docs markdown must stay in docs root or docs/guides: $file" ;;
  esac
done < <(find docs -type f -name '*.md' -print0)

note "checking pack metadata"
jq -e '.id == "diabolical"' pack.mcmeta >/dev/null || fail "pack.mcmeta id must be diabolical"
jq -e '.pack.pack_format == 80' pack.mcmeta >/dev/null || fail "pack_format must be 80"
jq -e '.pack.supported_formats.min_inclusive == 80' pack.mcmeta >/dev/null || fail "minimum supported format must be 80"
jq -e '.pack.supported_formats.max_inclusive == 88' pack.mcmeta >/dev/null || fail "maximum supported format must be 88"
jq -e '.pack.min_format == [80, 0]' pack.mcmeta >/dev/null || fail "min_format must be [80, 0]"
jq -e '.pack.max_format == [88, 0]' pack.mcmeta >/dev/null || fail "max_format must be [88, 0]"
grep -Fq 'version:"0.4.1-dev"' data/diabolical/function/config/defaults.mcfunction || fail "config storage version must be 0.4.1-dev"
grep -Fq 'version:"0.4.1-dev",phase:23' data/diabolical/function/core/init.mcfunction || fail "runtime storage version must be 0.4.1-dev phase 23"
grep -Fq 'version:"0.4.1-dev",phase:23' data/diabolical/function/contracts/init.mcfunction || fail "contracts storage version must be 0.4.1-dev phase 23"
grep -Fq 'version:"0.4.1-dev",phase:23' data/diabolical/function/rituals/init.mcfunction || fail "rituals storage version must be 0.4.1-dev phase 23"
grep -Fq 'version:"0.4.1-dev",phase:23' data/diabolical/function/relics/init.mcfunction || fail "relics storage version must be 0.4.1-dev phase 23"
grep -Fq 'version:"0.4.1-dev",phase:23' data/diabolical/function/events/init.mcfunction || fail "events storage version must be 0.4.1-dev phase 23"
grep -Fq 'version:"0.4.1-dev",phase:23' data/diabolical/function/mobs/init.mcfunction || fail "mobs storage version must be 0.4.1-dev phase 23"
check_png docs/assets/diabolical-logo.png
check_png docs/assets/diabolical-items-preview.png

note "checking optional resource-pack metadata"
resource_pack_root="resourcepacks/diabolical_optional_resources"
jq -e '.id == "diabolical_optional_resources"' "${resource_pack_root}/pack.mcmeta" >/dev/null || fail "optional resource pack id must be diabolical_optional_resources"
jq -e '.pack.pack_format == 63' "${resource_pack_root}/pack.mcmeta" >/dev/null || fail "optional resource pack format must be 63"
jq -e '.pack.supported_formats.min_inclusive == 63' "${resource_pack_root}/pack.mcmeta" >/dev/null || fail "optional resource pack minimum supported format must be 63"
jq -e '.pack.supported_formats.max_inclusive == 64' "${resource_pack_root}/pack.mcmeta" >/dev/null || fail "optional resource pack maximum supported format must be 64"
jq -e '.pack.min_format == [63, 0]' "${resource_pack_root}/pack.mcmeta" >/dev/null || fail "optional resource pack min_format must be [63, 0]"
jq -e '.pack.max_format == [64, 0]' "${resource_pack_root}/pack.mcmeta" >/dev/null || fail "optional resource pack max_format must be [64, 0]"

note "checking release automation"
grep -Fq 'scripts/release.sh' .github/workflows/ci.yml || fail "CI workflow must use release preflight"
grep -Fq 'actions/checkout@v6' .github/workflows/ci.yml || fail "CI workflow must use current checkout action"
grep -Fq 'actions/upload-artifact@v7' .github/workflows/ci.yml || fail "CI workflow must upload package artifacts"
grep -Fq 'tags:' .github/workflows/release.yml || fail "release workflow must run from tags"
grep -Fq 'contents: write' .github/workflows/release.yml || fail "release workflow must have release publishing permission"
grep -Fq 'gh release create' .github/workflows/release.yml || fail "release workflow must create GitHub releases"
grep -Fq -- '--generate-notes' .github/workflows/release.yml || fail "release workflow must use generated release notes"
grep -Fq 'changelog:' .github/release.yml || fail "release note configuration must define changelog categories"

note "checking JSON"
while IFS= read -r -d '' file; do
  jq empty "$file" >/dev/null || fail "invalid JSON: $file"
done < <(find . -path ./.git -prune -o -path ./dist -prune -o -type f -name '*.json' -print0)

note "checking function tag references"
check_function_ref() {
  local id="$1"
  local namespace
  local path
  local file

  [[ -n "$id" ]] || fail "empty function reference"

  if [[ "$id" == \#* ]]; then
    return 0
  fi

  [[ "$id" == *:* ]] || fail "function reference lacks namespace: $id"

  namespace="${id%%:*}"
  path="${id#*:}"
  file="data/${namespace}/function/${path}.mcfunction"

  [[ -f "$file" ]] || fail "function reference missing file: $id -> $file"
}

check_advancement_ref() {
  local id="$1"
  local namespace
  local path
  local file

  [[ -n "$id" ]] || fail "empty advancement reference"
  [[ "$id" == *:* ]] || fail "advancement reference lacks namespace: $id"

  namespace="${id%%:*}"
  path="${id#*:}"
  file="data/${namespace}/advancement/${path}.json"

  [[ -f "$file" ]] || fail "advancement reference missing file: $id -> $file"
}

check_structure_ref() {
  local id="$1"
  local namespace
  local path
  local file

  [[ -n "$id" ]] || fail "empty structure reference"
  [[ "$id" == *:* ]] || fail "structure reference lacks namespace: $id"

  namespace="${id%%:*}"
  path="${id#*:}"
  file="data/${namespace}/worldgen/structure/${path}.json"

  [[ -f "$file" ]] || fail "structure reference missing file: $id -> $file"
}

check_template_pool_ref() {
  local id="$1"
  local namespace
  local path
  local file

  [[ -n "$id" ]] || fail "empty template pool reference"
  [[ "$id" == *:* ]] || fail "template pool reference lacks namespace: $id"

  namespace="${id%%:*}"
  path="${id#*:}"
  file="data/${namespace}/worldgen/template_pool/${path}.json"

  [[ -f "$file" ]] || fail "template pool reference missing file: $id -> $file"
}

check_structure_template_ref() {
  local id="$1"
  local namespace
  local path
  local file

  [[ -n "$id" ]] || fail "empty structure template reference"
  [[ "$id" == *:* ]] || fail "structure template reference lacks namespace: $id"

  namespace="${id%%:*}"
  path="${id#*:}"
  file="data/${namespace}/structure/${path}.nbt"

  [[ -f "$file" ]] || fail "structure template reference missing file: $id -> $file"
}

while IFS= read -r id; do
  check_function_ref "$id"
done < <(jq -r '.values[] | if type == "string" then . elif type == "object" then .id else empty end' data/minecraft/tags/function/load.json data/minecraft/tags/function/tick.json)

note "checking advancement references"
while IFS= read -r -d '' file; do
  jq -e '.criteria | type == "object" and length > 0' "$file" >/dev/null || fail "advancement missing criteria: $file"

  parent="$(jq -r '.parent // empty' "$file")"
  if jq -e 'has("display") and ((.display.hidden // false) == false)' "$file" >/dev/null; then
    jq -e '.display.icon.id | type == "string" and length > 0' "$file" >/dev/null || fail "visible advancement missing icon id: $file"
    jq -e '.display.title.text | type == "string" and length > 0' "$file" >/dev/null || fail "visible advancement missing title text: $file"
    jq -e '.display.description.text | type == "string" and length > 0' "$file" >/dev/null || fail "visible advancement missing description text: $file"

    if [[ "$file" != "data/diabolical/advancement/root.json" && -z "$parent" ]]; then
      fail "visible advancement must have a parent unless it is root: $file"
    fi
  fi

  if [[ -n "$parent" ]]; then
    check_advancement_ref "$parent"
  fi

  reward_function="$(jq -r '.rewards.function // empty' "$file")"
  if [[ -n "$reward_function" ]]; then
    check_function_ref "$reward_function"
  fi
done < <(find data -type f -path '*/advancement/*.json' -print0)

note "checking structure and loot table references"
while IFS= read -r -d '' file; do
  jq -e '.type == "minecraft:chest" and (.pools | type == "array") and (.pools | length > 0)' "$file" >/dev/null || fail "bad loot table shape: $file"
done < <(find data -type f -path '*/loot_table/*.json' -print0)

note "checking recipes"
while IFS= read -r -d '' file; do
  jq -e '(.type == "minecraft:crafting_shaped" or .type == "minecraft:crafting_shapeless") and (.result.id | type == "string") and (.result.count | type == "number")' "$file" >/dev/null || fail "bad recipe shape: $file"
done < <(find data -type f -path '*/recipe/*.json' -print0)

for court_item in black_writ court_candle bailiff_bell sinners_effigy ashen_brief; do
  recipe_file="data/diabolical/recipe/${court_item}.json"
  give_file="data/diabolical/function/mobs/give/${court_item}.mcfunction"
  use_file="data/diabolical/function/mobs/use/${court_item}.mcfunction"

  [[ -f "$recipe_file" ]] || fail "missing court item recipe: $recipe_file"
  [[ -f "$give_file" ]] || fail "missing court item grant function: $give_file"
  [[ -f "$use_file" ]] || fail "missing court item use function: $use_file"
  jq -e --arg court_item "$court_item" '.result.components."minecraft:custom_data".diabolical.court_item == $court_item' "$recipe_file" >/dev/null || fail "court item recipe missing custom_data: $recipe_file"
  grep -q "minecraft:custom_data={diabolical:{court_item:\"${court_item}\"" "$give_file" || fail "court item grant missing custom data: $give_file"
done

[[ -f data/diabolical/function/mobs/give/accusers_seal.mcfunction ]] || fail "missing Accusers Seal grant function"
grep -q 'minecraft:custom_data={diabolical:{court_item:"accusers_seal"' data/diabolical/function/mobs/give/accusers_seal.mcfunction || fail "Accusers Seal grant missing custom data"

while IFS= read -r -d '' file; do
  jq -e '.type == "minecraft:jigsaw" and .start_pool and .project_start_to_heightmap == "WORLD_SURFACE_WG"' "$file" >/dev/null || fail "bad jigsaw structure definition: $file"
  check_template_pool_ref "$(jq -r '.start_pool' "$file")"
done < <(find data -type f -path '*/worldgen/structure/*.json' -print0)

while IFS= read -r -d '' file; do
  jq -e '.placement.type == "minecraft:random_spread" and .placement.spread_type == "linear" and .placement.frequency_reduction_method == "default" and (.placement.frequency == 1 or .placement.frequency == 1.0) and (.structures | type == "array") and (.structures | length > 0)' "$file" >/dev/null || fail "bad structure set definition: $file"
  while IFS= read -r id; do
    check_structure_ref "$id"
  done < <(jq -r '.structures[].structure' "$file")
done < <(find data -type f -path '*/worldgen/structure_set/*.json' -print0)

while IFS= read -r -d '' file; do
  jq -e '.fallback and (.elements | type == "array") and (.elements | length > 0)' "$file" >/dev/null || fail "bad template pool definition: $file"
  while IFS= read -r id; do
    [[ -n "$id" ]] || continue
    check_structure_template_ref "$id"
  done < <(jq -r '.elements[].element.location // empty' "$file")
done < <(find data -type f -path '*/worldgen/template_pool/*.json' -print0)

while IFS= read -r -d '' file; do
  gzip -t "$file" || fail "bad compressed structure NBT: $file"
done < <(find data -type f -path '*/structure/*.nbt' -print0)

python3 - <<'PY' || fail "structure loot table references are invalid"
import gzip
from pathlib import Path

expected = {
    "diabolical:chests/ashen_cache",
    "diabolical:chests/ledger_cache",
    "diabolical:chests/collector_cache",
}
known = {
    f"diabolical:chests/{path.stem}"
    for path in Path("data/diabolical/loot_table/chests").glob("*.json")
}

found = set()
for path in Path("data/diabolical/structure").glob("*.nbt"):
    raw = gzip.decompress(path.read_bytes())
    for ref in expected:
        if ref.encode() in raw:
            found.add(ref)
            if ref not in known:
                raise SystemExit(f"{path} references missing loot table {ref}")

missing = expected - found
if missing:
    raise SystemExit(f"structure NBT files do not reference expected loot tables: {sorted(missing)}")
PY

note "checking function command references"
while IFS= read -r -d '' file; do
  while IFS= read -r line; do
    [[ "$line" =~ ^[[:space:]]*# ]] && continue

    if [[ "$line" =~ ^[[:space:]]*\*\*\* ]]; then
      fail "patch marker found in function file: $file"
    fi

    if [[ "$line" =~ @p([^a-zA-Z0-9_]|$) ]]; then
      fail "use explicit @a selectors instead of @p for multiplayer ownership: $file"
    fi

    if [[ "$line" =~ (^|[[:space:]])kill[[:space:]]+@e([[:space:]]|$) ]]; then
      fail "kill @e must be scoped with selector arguments: $file"
    fi

    if [[ "$line" =~ (^|[[:space:]])function[[:space:]]+([a-z0-9_.-]+:[a-z0-9_./-]+) ]]; then
      check_function_ref "${BASH_REMATCH[2]}"
    fi

    if [[ "$line" =~ (^|[[:space:]])advancement[[:space:]]+(grant|revoke)[[:space:]]+[^[:space:]]+[[:space:]]+(only|from|until|through)[[:space:]]+([a-z0-9_.-]+:[a-z0-9_./-]+) ]]; then
      check_advancement_ref "${BASH_REMATCH[4]}"
    fi

    if [[ "$line" =~ ^[[:space:]]*data[[:space:]]+remove[[:space:]]+storage[[:space:]]+[a-z0-9_.-]+:[a-z0-9_./-]+[[:space:]]*$ ]]; then
      fail "data remove storage requires a path: $file"
    fi
  done < "$file"
done < <(find data -type f -name '*.mcfunction' -print0)

note "checking trigger objectives"
declare -A trigger_objectives=()
while IFS= read -r objective; do
  trigger_objectives["$objective"]=1
done < <(awk '$1 == "scoreboard" && $2 == "objectives" && $3 == "add" && $5 == "trigger" {print $4}' data/diabolical/function/load.mcfunction)

for objective in "${!trigger_objectives[@]}"; do
  grep -Fq "scoreboard players enable @a ${objective}" data/diabolical/function/actions/tick.mcfunction || fail "trigger objective is not enabled in actions/tick: $objective"
  grep -Fq "scoreboard players set @a[scores={${objective}=1..}] ${objective} 0" data/diabolical/function/actions/tick.mcfunction || fail "trigger objective is not reset in actions/tick: $objective"
done

while IFS= read -r objective; do
  [[ -n "${trigger_objectives[$objective]:-}" ]] || fail "clickable trigger uses unknown objective: $objective"
done < <(grep -RhoE '/?trigger[[:space:]]+diab\.[a-z0-9_.-]+' data/diabolical/function | awk '{print $2}' | sort -u)

note "checking data-pack path casing"
while IFS= read -r -d '' path; do
  if [[ "$path" =~ [A-Z] ]]; then
    fail "data-pack paths must be lowercase: $path"
  fi
done < <(find data -type f -print0)

note "checking optional resource-pack path casing"
while IFS= read -r -d '' path; do
  if [[ "$path" =~ [A-Z] ]]; then
    fail "resource-pack paths must be lowercase: $path"
  fi
done < <(find "$resource_pack_root" -type f -print0)

note "checking optional resource-pack item models"
for item in infernal_ledger infernal_primer ashen_charm midas_coin hellbound_compass awakened_hellbound_compass black_writ court_candle bailiff_bell sinners_effigy ashen_brief accusers_seal; do
  item_file="${resource_pack_root}/assets/diabolical/items/${item}.json"
  model_file="${resource_pack_root}/assets/diabolical/models/item/${item}.json"
  texture_file="${resource_pack_root}/assets/diabolical/textures/item/${item}.png"

  [[ -f "$item_file" ]] || fail "missing namespaced item model definition: $item_file"
  [[ -f "$model_file" ]] || fail "missing namespaced raw item model: $model_file"
  check_png_size "$texture_file" 16 16
  jq -e --arg model "diabolical:item/${item}" '.model.type == "minecraft:model" and .model.model == $model' "$item_file" >/dev/null || fail "bad namespaced item model definition: $item_file"
  jq -e --arg texture "diabolical:item/${item}" '.parent == "minecraft:item/generated" and .textures.layer0 == $texture' "$model_file" >/dev/null || fail "bad namespaced raw item model texture: $model_file"
done

for vanilla_item in book carrot_on_a_stick fire_charge gold_nugget recovery_compass paper red_candle bell armor_stand netherite_scrap; do
  [[ -f "${resource_pack_root}/assets/minecraft/items/${vanilla_item}.json" ]] || fail "missing vanilla item override: ${vanilla_item}"
done

declare -A visual_item_bases=(
  [infernal_primer]=book
  [ashen_brief]=book
  [infernal_ledger]=carrot_on_a_stick
  [ashen_charm]=fire_charge
  [midas_coin]=gold_nugget
  [hellbound_compass]=recovery_compass
  [awakened_hellbound_compass]=recovery_compass
  [black_writ]=paper
  [court_candle]=red_candle
  [bailiff_bell]=bell
  [sinners_effigy]=armor_stand
  [accusers_seal]=netherite_scrap
)

for item in "${!visual_item_bases[@]}"; do
  file="${resource_pack_root}/assets/minecraft/items/${visual_item_bases[$item]}.json"
  jq -e --arg when "diabolical:${item}" --arg model "diabolical:item/${item}" '.model.cases[] | select(.when == $when and .model.model == $model)' "$file" >/dev/null || fail "vanilla item override missing custom model case for ${item}: $file"
done

while IFS= read -r -d '' file; do
  jq -e '.model.type == "minecraft:select" and .model.property == "minecraft:custom_model_data" and (.model.index // 0) == 0' "$file" >/dev/null || fail "vanilla item override must select by custom_model_data string index 0: $file"
  jq -e '.__smithed__.rules | type == "array" and length > 0' "$file" >/dev/null || fail "vanilla item override missing Smithed/Weld metadata: $file"
done < <(find "${resource_pack_root}/assets/minecraft/items" -type f -name '*.json' -print0)

note "checking relic custom data"
for relic in ashen_charm midas_coin hellbound_compass awakened_hellbound_compass; do
  file="data/diabolical/function/relics/give/${relic}.mcfunction"
  [[ -f "$file" ]] || fail "missing relic grant function: $file"
  grep -q "minecraft:custom_data={diabolical:{relic:\"${relic}\"" "$file" || fail "relic grant missing custom data: $file"
  grep -Fq "minecraft:custom_model_data={strings:[\"diabolical:${relic}\"]}" "$file" || fail "relic grant missing namespaced custom model data string: $file"
done

note "checking interface item custom data"
ledger_file="data/diabolical/function/contracts/give/infernal_ledger.mcfunction"
[[ -f "$ledger_file" ]] || fail "missing infernal ledger grant function: $ledger_file"
grep -q 'minecraft:custom_data={diabolical:{tool:"infernal_ledger"' "$ledger_file" || fail "ledger grant missing custom data: $ledger_file"
grep -Fq 'minecraft:custom_model_data={strings:["diabolical:infernal_ledger"]}' "$ledger_file" || fail "ledger grant missing namespaced custom model data string: $ledger_file"
primer_file="data/diabolical/function/progression/give/infernal_primer.mcfunction"
[[ -f "$primer_file" ]] || fail "missing infernal primer grant function: $primer_file"
grep -q 'minecraft:custom_data={diabolical:{tool:"infernal_primer"' "$primer_file" || fail "primer grant missing custom data: $primer_file"
grep -Fq 'minecraft:custom_model_data={strings:["diabolical:infernal_primer"]}' "$primer_file" || fail "primer grant missing namespaced custom model data string: $primer_file"

note "checking court item custom data"
for court_item in black_writ court_candle bailiff_bell sinners_effigy ashen_brief accusers_seal; do
  file="data/diabolical/function/mobs/give/${court_item}.mcfunction"
  [[ -f "$file" ]] || fail "missing court item grant function: $file"
  grep -q "minecraft:custom_data={diabolical:{court_item:\"${court_item}\"" "$file" || fail "court item grant missing custom data: $file"
  grep -Fq "minecraft:custom_model_data={strings:[\"diabolical:${court_item}\"]}" "$file" || fail "court item grant missing namespaced custom model data string: $file"
done

for court_recipe in black_writ court_candle bailiff_bell sinners_effigy ashen_brief; do
  file="data/diabolical/recipe/${court_recipe}.json"
  [[ -f "$file" ]] || fail "missing court item recipe: $file"
  jq -e --arg item "$court_recipe" '.result.components["minecraft:custom_data"].diabolical.court_item == $item' "$file" >/dev/null || fail "court item recipe missing custom data: $file"
  jq -e --arg cmd "diabolical:${court_recipe}" '.result.components["minecraft:custom_model_data"].strings[0] == $cmd' "$file" >/dev/null || fail "court item recipe missing custom model data string: $file"
done

note "checking line endings"
mapfile -t crlf_files < <(find . \
  -path ./.git -prune -o \
  -path ./dist -prune -o \
  -type f \( -name '*.mcfunction' -o -name '*.json' -o -name '*.md' -o -name '*.sh' \) \
  -exec grep -Il $'\r' {} +)

if ((${#crlf_files[@]})); then
  printf '%s\n' "${crlf_files[@]}" >&2
  fail "CRLF line endings found"
fi

note "ok"
