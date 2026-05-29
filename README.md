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

Diabolical adds a quiet infernal layer to normal Minecraft survival. Players
find a primer, build an altar, sign contracts, carry cursed relics, and decide
how much debt they can live with before the world starts answering back.

It is a data pack first. The resource pack is optional and only changes item
visuals.

## What It Adds

- player-built rituals
- contracts with real costs
- sin, debt, and recovery loops
- cursed relics and an Infernal Ledger
- The Sinbound Court with custom vanilla mobs for high-sin players
- craftable court items and controlled mob trials
- Diabolical Night, Debt Collectors, and audit warnings
- small Infernal Ruins in newly generated overworld chunks
- optional 16x16 item textures for ledgers, relics, and court items

## Getting Started

Build the data pack:

```sh
scripts/package.sh 0.4.1-dev
```

Put `dist/Diabolical-0.4.1-dev.zip` in your world's `datapacks/` folder, then
run:

```mcfunction
/reload
function diabolical:debug/status
```

Players receive the Infernal Primer when their Diabolical state initializes.
The first loop is explained in [Getting Started](docs/getting-started.md).

## Optional Resource Pack

The sidecar resource pack gives the Ledger, Primer, relics, compass items, and
Sinbound Court items vanilla-sized custom textures.

<p align="center">
  <img src="docs/assets/diabolical-items-preview.png" alt="Diabolical optional item textures" width="520">
</p>

Build it separately:

```sh
scripts/package_resourcepack.sh 0.4.1-dev
```

Install `dist/Diabolical-optional-resources-0.4.1-dev.zip` as a normal resource
pack. Do not put it in `datapacks/`.

## Useful Links

- [Getting Started](docs/getting-started.md)
- [Server Guide](docs/guides/server-admin.md)
- [Sinbound Court](docs/guides/sinbound-court.md)
- [Optional Resource Pack](docs/guides/optional-resource-pack.md)
- [Infernal Ruins](docs/guides/structures.md)

## Technical Notes

- Minecraft Java data pack formats: `80` through `88`
- optional resource pack formats: `63` through `64`
- pack namespace: `diabolical`
- scoreboard and tag prefix: `diab.*`
- gameplay item identity uses `minecraft:custom_data`
- optional visuals use namespaced `minecraft:custom_model_data` strings

Run the local check before packaging:

```sh
scripts/validate.sh
git diff --check
bash -n scripts/validate.sh scripts/package.sh scripts/package_resourcepack.sh
```

Static checks validate file structure, JSON, function references, recipes,
resource-pack models, 16x16 item textures, structure links, and package layout.
A real Minecraft world is still needed for final balance and generation
testing.

## License

MIT. See [LICENSE](LICENSE).
