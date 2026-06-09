# Manual Playtest

## Headless Paper Smoke

```sh
scripts/paper_smoke.sh 0.5.0-dev
```

Slow first boot:

```sh
PAPER_SMOKE_TIMEOUT=420 scripts/paper_smoke.sh 0.5.0-dev
```

Local Mojang jar:

```sh
scripts/paper_smoke.sh 0.5.0-dev --mojang-jar path/to/mojang_1.21.11.jar
```

Expected profile gates: calm `70/220`, hard `40/120`, default `50/150`.

## Fresh World

1. Put `dist/Diabolical-0.5.0-dev.zip` in a fresh world's `datapacks/` folder.
2. Run `/reload`.
3. Run `function diabolical:debug/status`.
4. Run `function diabolical:config/status`.
5. Confirm the version is `0.5.0-dev`, runtime phase is `25`, and the balance
   profile is `default`.
6. Confirm a new player receives the Infernal Primer.
7. Confirm `/datapack list enabled` includes the Diabolical zip.

## First Player Loop

1. Build the altar: crying obsidian center, soul sand or soul soil on the four
   cardinal sides.
2. Drop paper, an ink sac, and a gold nugget on the altar.
3. Confirm First Signature grants the Infernal Ledger and a Hellbound Compass.
4. Right-click the Ledger and open Status, Contracts, Payments, Relics, Court,
   and Help.
5. Confirm Contracts is grouped into Starter Clauses, Red Clauses, and Major
   Clauses.
6. Sign one minor contract and confirm Payments shows the active pact.
7. Sign Blood Tithe, Ashen Credit, and Grave Collateral in focused reset passes.
   Confirm each has distinct cost text, advancement icon, Ledger marker, and
   Payments controls.
8. Pay or revoke the pact and confirm debt/sin changes are readable.

## Recovery And Pressure

1. Use `function diabolical:debug/reset_self` before each focused pass.
2. Add debt with a contract, then perform Ashes Paid.
3. Add sin, then verify the Court page shows the current profile gates.
4. Trigger a controlled court item and confirm only one court encounter is
   active at a time.
5. Raise debt above the collector gate and confirm a Debt Collector can start.
6. Raise group debt or sin above audit gates and confirm Infernal Audit warns
   without destroying player state.

## Profiles

```mcfunction
function diabolical:config/profile/calm
function diabolical:config/profile/default
function diabolical:config/profile/hard
```

Confirm gates change and a non-default profile survives `/reload`.

## Multiplayer

1. Join with two players.
2. Confirm both can initialize and receive the primer.
3. Confirm one player's First Signature does not grant contracts to the wrong
   distant player.
4. Start a court encounter for one player and confirm another player is not
   accidentally tagged as the court target.
5. Start a collector for one player and confirm only that player receives the
   collector target tag.

Also test two players near the same altar.

## Optional Resource Pack

1. Install `dist/Diabolical-optional-resources-0.5.0-dev.zip` as a resource pack.
2. Confirm the Primer, Ledger, relics, compass items, and court items render with
   custom 16x16 textures.
3. Confirm contract rows show Ledger glyph markers beside plain contract names.
4. Remove the resource pack and confirm the datapack still plays normally with
   vanilla item visuals and readable contract text.
