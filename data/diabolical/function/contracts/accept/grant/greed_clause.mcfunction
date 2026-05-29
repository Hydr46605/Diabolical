# Grants Greed Clause.
tag @s add diab.contract_active
tag @s add diab.contract.greed_clause
scoreboard players set @s diab.contract 5
scoreboard players set @s diab.cdebt 14
advancement grant @s only diabolical:contracts/unlocked
advancement grant @s only diabolical:contracts/greed_clause
function diabolical:advancements/check/starter_contracts
function diabolical:advancements/check/minor_contracts

scoreboard players set #amount diab.tmp 2
function diabolical:core/add_sin
scoreboard players set #amount diab.tmp 14
function diabolical:core/add_debt

give @s minecraft:gold_nugget 8
give @s minecraft:emerald 1
effect give @s minecraft:luck 20 0 true
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Signed: Greed Clause. The ledger pays small coin and records a larger balance.","color":"gray"}]
