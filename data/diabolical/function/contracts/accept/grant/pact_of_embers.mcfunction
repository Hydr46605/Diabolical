# Grants Pact of Embers.
tag @s add diab.contract_active
tag @s add diab.contract.pact_of_embers
scoreboard players set @s diab.contract 1
scoreboard players set @s diab.cdebt 8
advancement grant @s only diabolical:contracts/unlocked
advancement grant @s only diabolical:contracts/pact_of_embers
function diabolical:advancements/check/starter_contracts
function diabolical:advancements/check/minor_contracts

scoreboard players set #amount diab.tmp 2
function diabolical:core/add_sin
scoreboard players set #amount diab.tmp 8
function diabolical:core/add_debt

function diabolical:relics/give/ashen_charm
effect give @s minecraft:fire_resistance 20 0 true
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Signed: Pact of Embers. The ledger adds an Ashen Charm. Right-click the Infernal Ledger to pay or revoke.","color":"gray"}]
function diabolical:feedback/contract_signed
