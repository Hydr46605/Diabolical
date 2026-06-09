# Verification

```sh
scripts/validate.sh
```

Checks metadata, JSON, references, contract routes, recipes, models, Ledger font
assets, PNG size, structure NBT, selector guardrails, path casing, and line
endings.

```sh
scripts/release.sh 0.5.0-dev
```

Runs validation, shell syntax, whitespace, and builds both release zips.

```sh
scripts/paper_smoke.sh 0.5.0-dev
```

Boots Paper, loads the datapack, checks Red Ledger contract registration,
profile gates, reload persistence, and runtime log errors.

## Live Checklist

Use [Manual Playtest](manual-playtest.md) when reviewing a server install:

- first-player loop
- Blood Tithe, Ashen Credit, and Grave Collateral
- multiplayer ownership
- resource-pack visuals
- balance feel
