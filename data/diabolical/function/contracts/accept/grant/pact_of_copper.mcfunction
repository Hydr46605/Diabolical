# Grants Pact of Copper.
tag @s add diab.contract_active
tag @s add diab.contract.pact_of_copper
scoreboard players set @s diab.contract 4
scoreboard players set @s diab.cdebt 7
advancement grant @s only diabolical:contracts/unlocked
advancement grant @s only diabolical:contracts/pact_of_copper
function diabolical:advancements/check/starter_contracts
function diabolical:advancements/check/minor_contracts

scoreboard players set #amount diab.tmp 1
function diabolical:core/add_sin
scoreboard players set #amount diab.tmp 7
function diabolical:core/add_debt

give @s minecraft:copper_ingot 4
effect give @s minecraft:haste 20 0 true
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Signed: Pact of Copper. Copper underfoot now speeds your work. Right-click the Infernal Ledger to pay or revoke.","color":"gray"}]
function diabolical:feedback/contract_signed
