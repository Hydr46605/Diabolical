# Releasing

Diabolical releases are built from `main` and tagged with `v` plus the pack
version, for example `v0.4.1-dev`.

## Local Preflight

Run the same release preflight that CI uses:

```sh
scripts/release.sh 0.4.1-dev
```

The script validates the pack, checks shell syntax and whitespace, then builds:

- `dist/Diabolical-0.4.1-dev.zip`
- `dist/Diabolical-optional-resources-0.4.1-dev.zip`

## GitHub Flow

1. Commit release-ready changes to `main`.
2. Push `main`.
3. Create and push an annotated tag:

```sh
git tag -a v0.4.1-dev -m "Diabolical 0.4.1-dev"
git push origin main v0.4.1-dev
```

Pushing the tag runs the release workflow. The workflow rebuilds both zips,
creates the GitHub release, attaches the data-pack and optional resource-pack
artifacts, and uses GitHub generated release notes.

Versions with a suffix such as `-dev` or `-rc1` are published as prereleases.

## Checks

The CI workflow runs on `main`, pull requests, and manual dispatch. It builds
the same distributable zips as the release workflow and uploads them as a short
retention artifact for inspection.

Minecraft runtime smoke tests remain manual because they require a server jar
and a real world boot. Keep those results in the release notes when they are
run.
