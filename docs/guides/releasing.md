# Releasing

## Local Preflight

```sh
scripts/release.sh 0.5.0-dev
```

Builds:

- `dist/Diabolical-0.5.0-dev.zip`
- `dist/Diabolical-optional-resources-0.5.0-dev.zip`

## Tag

Run smoke first:

```sh
scripts/paper_smoke.sh 0.5.0-dev
```

Then tag:

```sh
git tag -a v0.5.0-dev -m "Diabolical 0.5.0-dev"
git push origin main v0.5.0-dev
```

Tag pushes create or update the GitHub release. Versions with `-dev`, `-rc1`,
or another suffix publish as prereleases.
