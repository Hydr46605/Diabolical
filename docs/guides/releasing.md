# Releasing

## Local Preflight

```sh
scripts/release.sh 0.4.2-rc1
```

Builds:

- `dist/Diabolical-0.4.2-rc1.zip`
- `dist/Diabolical-optional-resources-0.4.2-rc1.zip`

## Tag

Run smoke first:

```sh
scripts/paper_smoke.sh 0.4.2-rc1
```

Then tag:

```sh
git tag -a v0.4.2-rc1 -m "Diabolical 0.4.2-rc1"
git push origin main v0.4.2-rc1
```

Tag pushes create or update the GitHub release. Versions with `-dev`, `-rc1`,
or another suffix publish as prereleases.
