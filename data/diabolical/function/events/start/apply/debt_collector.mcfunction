# Applies a targeted Debt Collector encounter to the executing player.
data merge storage diabolical:events {debt_collector:{last_result:"started"}}
scoreboard players set #collector.active diab.event 1
execute store result score #collector.timer diab.event run data get storage diabolical:events debt_collector.duration_ticks
execute store result score #collector.cooldown diab.event run data get storage diabolical:events debt_collector.cooldown_ticks

tag @a remove diab.collector_target
tag @s add diab.collector_target
scoreboard players operation #collector.kills diab.event = @s diab.kills
kill @e[tag=diab.collector_guard]

execute at @s run summon minecraft:skeleton ~ ~ ~ {Tags:["diab.collector","diab.collector_guard"],CustomName:'{"text":"Debt Collector","color":"dark_red","bold":true}',PersistenceRequired:1b}
execute at @s as @e[tag=diab.collector_guard,distance=..4,limit=1,sort=nearest] run effect give @s minecraft:strength 120 0 true
execute at @s as @e[tag=diab.collector_guard,distance=..4,limit=1,sort=nearest] run effect give @s minecraft:resistance 120 0 true
execute at @s as @e[tag=diab.collector_guard,distance=..4,limit=1,sort=nearest] run effect give @s minecraft:fire_resistance 120 0 true
execute at @s as @e[tag=diab.collector_guard,distance=..4,limit=1,sort=nearest] run effect give @s minecraft:glowing 120 0 true
execute if score @s diab.debt >= #collector.severe_debt diab.event at @s as @e[tag=diab.collector_guard,distance=..4,limit=1,sort=nearest] run effect give @s minecraft:resistance 120 1 true
execute if score @s diab.debt >= #collector.severe_debt diab.event at @s as @e[tag=diab.collector_guard,distance=..4,limit=1,sort=nearest] run effect give @s minecraft:speed 120 1 true

tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"A Debt Collector has found your balance. Defeat it to force a payment credit.","color":"gray"}]
execute if score @s diab.debt >= #collector.severe_debt diab.event run tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Your balance is severe enough for a senior collector profile.","color":"red"}]
title @s actionbar {"text":"Debt Collector dispatched.","color":"dark_red"}
playsound minecraft:block.bell.use master @s ~ ~ ~ 0.8 0.5
execute at @s run particle minecraft:soul ~ ~1 ~ 0.7 0.5 0.7 0.01 22 force @s
execute at @s run particle minecraft:ash ~ ~1 ~ 0.9 0.6 0.9 0.02 30 force @s
