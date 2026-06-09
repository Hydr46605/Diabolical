# Shows the Infernal Ledger payments page.
tellraw @s [{"text":"Infernal Ledger","color":"dark_red","bold":true},{"text":" - Payments","color":"gray","bold":false}]
function diabolical:interface/ledger/nav
function diabolical:interface/ledger/summary
execute if score #contracts diab.config matches 0 run function diabolical:interface/ledger/disabled/contracts
execute if score #contracts diab.config matches 1 unless entity @s[tag=diab.contract_active] run tellraw @s [{"text":"No active contract. Open Contracts to sign a pact.","color":"gray"}]
execute if score #contracts diab.config matches 1 if entity @s[tag=diab.contract.pact_of_embers] run function diabolical:contracts/offer/active/pact_of_embers
execute if score #contracts diab.config matches 1 if entity @s[tag=diab.contract.pact_of_hunger] run function diabolical:contracts/offer/active/pact_of_hunger
execute if score #contracts diab.config matches 1 if entity @s[tag=diab.contract.red_ledger_minor] run function diabolical:contracts/offer/active/red_ledger_minor
execute if score #contracts diab.config matches 1 if entity @s[tag=diab.contract.pact_of_copper] run function diabolical:contracts/offer/active/pact_of_copper
execute if score #contracts diab.config matches 1 if entity @s[tag=diab.contract.greed_clause] run function diabolical:contracts/offer/active/greed_clause
execute if score #contracts diab.config matches 1 if entity @s[tag=diab.contract.the_red_ledger] run function diabolical:contracts/offer/active/the_red_ledger
execute if score #contracts diab.config matches 1 if entity @s[tag=diab.contract.blood_tithe] run function diabolical:contracts/offer/active/blood_tithe
execute if score #contracts diab.config matches 1 if entity @s[tag=diab.contract.ashen_credit] run function diabolical:contracts/offer/active/ashen_credit
execute if score #contracts diab.config matches 1 if entity @s[tag=diab.contract.grave_collateral] run function diabolical:contracts/offer/active/grave_collateral
execute if score #contracts diab.config matches 1 if entity @s[tag=diab.contract_active] run tellraw @s [{"text":"Revoking closes the pact but does not pay total debt.","color":"dark_gray"}]
