# Stops the active Debt Collector encounter and clears temporary state.
data merge storage diabolical:events {debt_collector:{last_result:"stopped"}}
execute if score #collector.active diab.event matches 1 as @a[tag=diab.collector_target] at @s run playsound minecraft:block.bell.use master @s ~ ~ ~ 0.45 1.2
execute if score #collector.active diab.event matches 1 as @a[tag=diab.collector_target] at @s run particle minecraft:ash ~ ~1 ~ 0.45 0.3 0.45 0.01 12 force @s
scoreboard players set #collector.active diab.event 0
scoreboard players set #collector.timer diab.event 0
scoreboard players set #collector.kills diab.event 0
kill @e[tag=diab.collector_guard]
tag @a remove diab.collector_target
