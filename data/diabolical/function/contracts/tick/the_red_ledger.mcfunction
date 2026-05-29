# The Red Ledger: persistent pressure and recurring collector attention.
effect give @s minecraft:unluck 3 0 true
execute if score @s diab.cdebt matches 1.. run effect give @s minecraft:glowing 3 0 true
execute if score #events diab.config matches 1 if score @s diab.cdebt matches 1.. unless score #event.active diab.event matches 1 unless score #collector.active diab.event matches 1 unless score #collector.cooldown diab.event matches 1.. if score @s diab.debt matches 50.. run function diabolical:events/start/debt_collector
