# Releasing

## Prepare Notes

Update:

- `CHANGELOG.md`
- `docs/releases/<version>.md`

The changelog stays short. The release note file is the body used by the GitHub
release.

## Local Build

```sh
scripts/release.sh 0.5.0-dev
```

Builds:

- `dist/Diabolical-0.5.0-dev.zip`
- `dist/Diabolical-optional-resources-0.5.0-dev.zip`

## Runtime Smoke

Run Paper smoke when runtime behavior, metadata, or packaging changed:

```sh
scripts/paper_smoke.sh 0.5.0-dev
```

## Tag And Publish

Review the branch before pushing a tag:

```sh
git tag -a v0.5.0-dev -m "Diabolical 0.5.0-dev"
git push origin main v0.5.0-dev
```

Tag pushes create or update the GitHub release and upload both zip assets.

Suffix versions such as `-dev`, `-rc`, and `-rc1` publish as prereleases by
default. Suffix-free versions publish as normal latest releases.
