# Grants Pact of Hunger.
tag @s add diab.contract_active
tag @s add diab.contract.pact_of_hunger
scoreboard players set @s diab.contract 2
scoreboard players set @s diab.cdebt 6
advancement grant @s only diabolical:contracts/unlocked
advancement grant @s only diabolical:contracts/pact_of_hunger
function diabolical:advancements/check/starter_contracts
function diabolical:advancements/check/minor_contracts

scoreboard players set #amount diab.tmp 1
function diabolical:core/add_sin
scoreboard players set #amount diab.tmp 6
function diabolical:core/add_debt

effect give @s minecraft:strength 20 0 true
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Signed: Pact of Hunger. Right-click the Infernal Ledger to pay or revoke.","color":"gray"}]
function diabolical:feedback/contract_signed
