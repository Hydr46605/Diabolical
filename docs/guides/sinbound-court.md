# Sinbound Court

High sin can call court mobs. Crafted court items can start controlled trials.

## Court Mobs

| Mob | Trigger |
| --- | --- |
| Contract Imp | profile sin gate, or failed Red Moon backlash |
| Sin Wraith | higher profile sin gate, or Sinners Effigy |
| Ledger Bailiff | mixed profile debt and sin gates, or Bailiff Bell |
| Ashen Advocate | Court Candle or severe audit pressure |
| The Accuser | highest profile sin gate or Black Writ |

Only one court encounter runs at a time. Default gates: sin `25`, sin `75`, debt
`35` plus sin `25`, and sin `150`.

## Court Items

Use these from the Ledger's Court page while held:

| Item | Use |
| --- | --- |
| Black Writ | calls The Accuser and adds sin |
| Court Candle | calls an Ashen Advocate |
| Bailiff Bell | calls a Ledger Bailiff |
| Sinners Effigy | baits a Sin Wraith |
| Ashen Brief | cleanses sin without starting a fight |
| Accusers Seal | rare recovery item from The Accuser |

```mcfunction
function diabolical:debug/give_court_items
```

Debug starts are under `diabolical:mobs/debug/`.
