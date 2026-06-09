<p align="center">
  <img src="docs/assets/diabolical-logo.png" alt="Diabolical" width="680">
</p>

<p align="center">
  <a href="https://github.com/Hydr46605/Diabolical">
    <img alt="Available on GitHub" height="56" src="https://cdn.jsdelivr.net/npm/@intergrav/devins-badges@3/assets/cozy/available/github_vector.svg">
  </a>
  <img alt="Supported on PC" height="56" src="https://cdn.jsdelivr.net/npm/@intergrav/devins-badges@3/assets/cozy/supported/pc_vector.svg">
</p>

# Diabolical

Minecraft Java data pack for infernal contracts, debt pressure, relics, events,
and vanilla-mob trials.

The resource pack is optional and adds item visuals plus Ledger glyph markers.
Gameplay and text remain readable without it.

## Status

- Version: `0.5.0-dev`
- Data pack: formats `80`-`88`
- Optional resource pack: formats `63`-`64`
- Namespace: `diabolical`
- Smoke target: Paper `1.21.11`

## Features

- altar rituals and an Infernal Ledger
- contract, debt, sin, payment, and revocation loops
- Red Ledger contracts: Blood Tithe, Ashen Credit, and Grave Collateral
- cursed relics and recovery items
- Diabolical Night, Debt Collector, and Infernal Audit events
- Sinbound Court mob trials
- small Overworld ruins
- calm/default/hard profiles

## Install

```sh
scripts/package.sh 0.5.0-dev
```

Put `dist/Diabolical-0.5.0-dev.zip` in `world/datapacks/`, then run:

```mcfunction
/reload
function diabolical:debug/status
function diabolical:config/status
```

## Optional Resource Pack

```sh
scripts/package_resourcepack.sh 0.5.0-dev
```

Install `dist/Diabolical-optional-resources-0.5.0-dev.zip` as a normal resource
pack. The Ledger still uses plain text without it.

## Verification

```sh
scripts/validate.sh
scripts/release.sh 0.5.0-dev
scripts/paper_smoke.sh 0.5.0-dev
```

## Docs

- [Getting Started](docs/getting-started.md)
- [Server Admin](docs/guides/server-admin.md)
- [Verification](docs/guides/verification.md)
- [Sinbound Court](docs/guides/sinbound-court.md)
- [Optional Resource Pack](docs/guides/optional-resource-pack.md)
- [Infernal Ruins](docs/guides/structures.md)
- [Releasing](docs/guides/releasing.md)

## License

MPL-2.0. See [LICENSE](LICENSE).
