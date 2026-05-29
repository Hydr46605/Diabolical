# Getting Started

Diabolical starts quietly. New players receive an Infernal Primer, then decide
whether to build the first altar and sign the first deal.

## First Steps

1. Put the data-pack zip in the world's `datapacks/` folder.
2. Run `/reload`.
3. Join the world and read the Infernal Primer.
4. Build the altar from crying obsidian with soul sand or soul soil on the four
   sides.
5. Offer paper, an ink sac, and a gold nugget for First Signature.
6. Use the Infernal Ledger to view status, sign contracts, pay debt, use relics,
   and manage Sinbound Court trials.

## Recovery

Debt is meant to be managed, not ignored. The early recovery path is Ashes Paid,
a ritual that gives players a way back after the first bad decisions.

Sin is managed through Bell of Remission, Ashen Briefs, court trials, and rare
Accusers Seals. The court starts reacting naturally at sin 25 and becomes much
more dangerous at high sin.

## Lost Items

Operators can restore test items with:

```mcfunction
function diabolical:debug/give_primer
function diabolical:contracts/give/infernal_ledger
function diabolical:debug/give_relics
function diabolical:debug/give_court_items
```
