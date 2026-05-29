# Grants The Red Ledger.
tag @s add diab.contract_active
tag @s add diab.contract.the_red_ledger
scoreboard players set @s diab.contract 6
scoreboard players set @s diab.cdebt 60
advancement grant @s only diabolical:contracts/major_unlocked
advancement grant @s only diabolical:contracts/the_red_ledger

scoreboard players set #amount diab.tmp 4
function diabolical:core/add_sin
scoreboard players set #amount diab.tmp 60
function diabolical:core/add_debt

give @s minecraft:diamond 2
give @s minecraft:emerald 8
effect give @s minecraft:luck 20 1 true
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Signed: The Red Ledger. The payout is real. So is the collector attention.","color":"gray"}]
execute if score #events diab.config matches 1 unless score #event.active diab.event matches 1 unless score #collector.active diab.event matches 1 unless score #collector.cooldown diab.event matches 1.. run function diabolical:events/start/debt_collector
