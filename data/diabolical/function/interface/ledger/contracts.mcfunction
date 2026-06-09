# Shows the Infernal Ledger contracts page.
tellraw @s [{"text":"\ue120\ue130","font":"diabolical:ledger","color":"white"},{"text":" Infernal Ledger","color":"dark_red","bold":true},{"text":" - Contracts","color":"gray","bold":false}]
function diabolical:interface/ledger/nav
function diabolical:interface/ledger/summary
execute if entity @s[advancements={diabolical:contracts/major_unlocked=true}] run tag @s add diab.contracts_major_unlocked
execute if score #contracts diab.config matches 0 run function diabolical:interface/ledger/disabled/contracts
execute if score #contracts diab.config matches 1 unless entity @s[tag=diab.contracts_unlocked] run tellraw @s [{"text":"The contract pages are blank. Perform First Signature at an Infernal Altar.","color":"gray"}]
execute if score #contracts diab.config matches 1 if entity @s[tag=diab.contracts_unlocked,tag=!diab.contract_active] run tellraw @s [{"text":"One active pact at a time.","color":"gray"}]
execute if score #contracts diab.config matches 1 if entity @s[tag=diab.contracts_unlocked,tag=!diab.contract_active] run tellraw @s [{"text":"Starter Clauses","color":"gold","bold":true}]
execute if score #contracts diab.config matches 1 if entity @s[tag=diab.contracts_unlocked,tag=!diab.contract_active] run function diabolical:contracts/offer/pact_of_embers
execute if score #contracts diab.config matches 1 if entity @s[tag=diab.contracts_unlocked,tag=!diab.contract_active] run function diabolical:contracts/offer/pact_of_hunger
execute if score #contracts diab.config matches 1 if entity @s[tag=diab.contracts_unlocked,tag=!diab.contract_active] run function diabolical:contracts/offer/pact_of_copper
execute if score #contracts diab.config matches 1 if entity @s[tag=diab.contracts_unlocked,tag=!diab.contract_active] run tellraw @s [{"text":"Red Clauses","color":"dark_red","bold":true}]
execute if score #contracts diab.config matches 1 if entity @s[tag=diab.contracts_unlocked,tag=!diab.contract_active] run function diabolical:contracts/offer/red_ledger_minor
execute if score #contracts diab.config matches 1 if entity @s[tag=diab.contracts_unlocked,tag=!diab.contract_active] run function diabolical:contracts/offer/greed_clause
execute if score #contracts diab.config matches 1 if entity @s[tag=diab.contracts_unlocked,tag=!diab.contract_active] run function diabolical:contracts/offer/blood_tithe
execute if score #contracts diab.config matches 1 if entity @s[tag=diab.contracts_unlocked,tag=!diab.contract_active] run function diabolical:contracts/offer/ashen_credit
execute if score #contracts diab.config matches 1 if entity @s[tag=diab.contracts_unlocked,tag=diab.contracts_major_unlocked,tag=!diab.contract_active] run tellraw @s [{"text":"Major Clauses","color":"dark_purple","bold":true}]
execute if score #contracts diab.config matches 1 if entity @s[tag=diab.contracts_unlocked,tag=diab.contracts_major_unlocked,tag=!diab.contract_active] run function diabolical:contracts/offer/the_red_ledger
execute if score #contracts diab.config matches 1 if entity @s[tag=diab.contracts_unlocked,tag=diab.contracts_major_unlocked,tag=!diab.contract_active] run function diabolical:contracts/offer/grave_collateral
execute if score #contracts diab.config matches 1 if entity @s[tag=diab.contracts_unlocked,tag=!diab.contracts_major_unlocked,tag=!diab.contract_active] run tellraw @s [{"text":"Major clauses unlock after every minor contract is signed.","color":"dark_gray"}]
execute if score #contracts diab.config matches 1 if entity @s[tag=diab.contract_active] run tellraw @s [{"text":"A pact is already active. Open Payments to pay or revoke it.","color":"gray"}]
