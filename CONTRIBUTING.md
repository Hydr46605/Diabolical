# Contributing

Keep changes small, concrete, and easy to verify.

## Commits

Use short subjects with the existing style:

- `feat:` gameplay or content changes
- `fix:` bug fixes
- `docs:` public documentation changes
- `ci:` workflow and release automation changes
- `chore:` repository maintenance

Prefer concrete subjects, for example `ci: use versioned release notes`.

## Local Checks

Run the narrowest useful check while working. Before a release-facing change,
run:

```sh
scripts/validate.sh
scripts/release.sh 0.5.0-dev
```

Use `scripts/paper_smoke.sh 0.5.0-dev` when datapack runtime behavior, version
metadata, or packaging changes need a Paper boot check.

## Releases

Every release needs:

- a `CHANGELOG.md` entry
- a `docs/releases/<version>.md` note
- built data pack and optional resource-pack zips from `scripts/release.sh`

Tags use `v<version>`. Suffix versions such as `-dev` and `-rc` are prereleases
by default. Suffix-free versions are normal latest releases.
