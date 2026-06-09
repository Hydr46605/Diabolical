# Maintains the active Debt Collector encounter.
scoreboard players remove #collector.timer diab.event 1

execute unless entity @a[tag=diab.collector_target] run function diabolical:events/stop/debt_collector
execute if score #collector.active diab.event matches 1 if entity @e[tag=diab.collector_guard,nbt={Health:0.0f}] run function diabolical:events/reward/debt_collector
execute if score #collector.active diab.event matches 1 as @a[tag=diab.collector_target,limit=1] at @s if score @s diab.kills > #collector.kills diab.event if entity @e[tag=diab.collector_guard,distance=..32,limit=1] run function diabolical:events/reward/debt_collector
execute if score #collector.active diab.event matches 1 as @a[tag=diab.collector_target,limit=1] if score @s diab.kills > #collector.kills diab.event unless entity @e[tag=diab.collector_guard] run function diabolical:events/reward/debt_collector
execute if score #collector.active diab.event matches 1 unless entity @e[tag=diab.collector_guard] run function diabolical:events/stop/debt_collector
execute if score #collector.active diab.event matches 1 if score #collector.timer diab.event matches ..0 run function diabolical:events/stop/debt_collector

execute if score #collector.active diab.event matches 1 as @e[tag=diab.collector_guard] at @s run effect give @s minecraft:speed 2 0 true
execute if score #collector.active diab.event matches 1 as @e[tag=diab.collector_guard] at @s run effect give @s minecraft:glowing 2 0 true
execute if score #collector.active diab.event matches 1 as @a[tag=diab.collector_target] at @s run effect give @s minecraft:glowing 2 0 true
execute if score #collector.active diab.event matches 1 at @a[tag=diab.collector_target] run particle minecraft:ash ~ ~1 ~ 0.8 0.6 0.8 0.01 8 force @a[distance=..16]
