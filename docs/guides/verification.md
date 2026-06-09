# Verification

```sh
scripts/validate.sh
```

Checks metadata, JSON, references, recipes, models, PNG size, structure NBT,
selector guardrails, path casing, and line endings.

```sh
scripts/release.sh 0.4.2-rc1
```

Runs validation, shell syntax, whitespace, and builds both release zips.

```sh
scripts/paper_smoke.sh 0.4.2-rc1
```

Boots Paper, loads the datapack, checks profile gates, reload persistence, and
runtime log errors.

## Live Checklist

Use [Manual Playtest](manual-playtest.md) when reviewing a server install:

- first-player loop
- multiplayer ownership
- resource-pack visuals
- balance feel
