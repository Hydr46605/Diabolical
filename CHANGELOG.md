# Changelog

## 0.4.2-rc1

- Prepared the repository for public review with clearer README, verification,
  release, and server-operation documentation.
- Switched the public license to MPL-2.0.
- Added calm, default, and hard balance profiles for server operators.
- Reworked natural event and Sinbound Court pressure to use profile-backed
  thresholds instead of fixed runtime cutoffs.
- Expanded config and debug status output with profile, event gate, collector
  gate, and court gate visibility.
- Improved early onboarding text for the Infernal Primer, Infernal Ledger, and
  First Signature flow.
- Added a manual playtest guide for fresh-world, two-player, profile, court,
  event, and optional resource-pack verification.
- Added a repeatable local Paper smoke script for datapack load, profile gate,
  reload, and runtime log checks.
- Fixed Infernal Ruins structure files so Paper can load them as named-root
  structure NBT during world generation.
- Bumped versioned runtime storage to phase 24.

## 0.4.1-dev

- Added a feedback pass with one-shot sounds and particles for sin, debt,
  payments, contract signing and closing, relic activations, event rewards, and
  Sinbound Court item use and victories.
- Reworked the optional resource pack with refreshed 16x16 legacy item
  textures and new court item textures.
- Added optional visual model data for Black Writ, Court Candle, Bailiff Bell,
  Sinners Effigy, Ashen Brief, and Accusers Seal.
- Added GitHub Actions CI, tag-driven release publishing, release-note
  configuration, and a reusable local release preflight script.
- Expanded validation and resource-pack packaging checks for the new visual
  item coverage.
- Bumped versioned runtime storage to phase 23.

## 0.4.0-dev

- Added The Sinbound Court update.
- Added a dedicated mobs module for Contract Imps, Sin Wraiths, Ledger
  Bailiffs, Ashen Advocates, and The Accuser.
- Added craftable court items: Black Writ, Court Candle, Bailiff Bell,
  Sinners Effigy, and Ashen Brief.
- Added a court page to the Infernal Ledger and a `diab.court` trigger route.
- Added Sinbound Court advancements and a hidden mastery challenge.
- Improved Diabolical Night, Infernal Audit, Debt Collector, and ritual
  backlash particles and feedback.
- Added mob config controls, debug helpers, recipe validation, and versioned
  runtime storage for phase 22.

## 0.3.0-dev

- Reworked the public README and docs.
- Added vanilla-sized 16x16 optional item textures.
- Added Infernal Ruins: Ash Circle, Ledger Cairn, and Collector Post.
- Added namespaced loot tables for ruin caches.
- Added validation for public docs, item texture dimensions, structure links,
  compressed NBT files, and package layout.

## 0.2.0-rc1

- Expanded the core pack with the Infernal Ledger, contracts, relics, events,
  advancements, config controls, and the optional resource-pack sidecar.

## 0.1.0-rc1

- Packaged the first release candidate with validation, install notes, and
  project licensing.
