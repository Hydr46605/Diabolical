# Maintains Diabolical Night pressure.
scoreboard players remove #diabolical_night diab.event 1

function diabolical:events/target/refresh_diabolical_night

execute at @a[tag=diab.event_target] as @e[type=#diabolical:diabolical_night_hostiles,distance=..24] run effect give @s minecraft:speed 2 0 true
execute at @a[tag=diab.event_target] as @e[type=#diabolical:diabolical_night_hostiles,distance=..24] run effect give @s minecraft:strength 2 0 true
execute at @a[tag=diab.event_target] as @e[type=#diabolical:diabolical_night_hostiles,distance=..24] run effect give @s minecraft:glowing 2 0 true
execute if score #event.profile diab.event matches 2.. at @a[tag=diab.event_target] as @e[type=#diabolical:diabolical_night_hostiles,distance=..24] run effect give @s minecraft:resistance 2 0 true
execute if score #event.profile diab.event matches 3.. at @a[tag=diab.event_target] as @e[type=#diabolical:diabolical_night_hostiles,distance=..24] run effect give @s minecraft:fire_resistance 2 0 true
execute as @a[tag=diab.event_target] run effect give @s minecraft:darkness 3 0 true
execute if score #event.profile diab.event matches 3.. as @a[tag=diab.event_target] run effect give @s minecraft:weakness 3 0 true
execute as @a[tag=diab.event_target] at @s run particle minecraft:ash ~ ~1 ~ 0.5 0.4 0.5 0.01 4 force @a[distance=..16]
execute if score #event.profile diab.event matches 2.. as @a[tag=diab.event_target] at @s run particle minecraft:soul_fire_flame ~ ~1 ~ 0.45 0.35 0.45 0.01 4 force @a[distance=..18]
execute if score #event.profile diab.event matches 3.. as @a[tag=diab.event_target] at @s run particle minecraft:soul ~ ~1 ~ 0.5 0.4 0.5 0.01 5 force @a[distance=..20]

execute if score #diabolical_night diab.event matches ..0 run function diabolical:events/stop/diabolical_night
