# Applies Diabolical Night global event state.
data merge storage diabolical:events {active:"diabolical_night",last_result:"diabolical_night_started"}
scoreboard players set #event.active diab.event 1
execute store result score #diabolical_night diab.event run data get storage diabolical:events diabolical_night.duration_ticks
execute store result score #diabolical_night.cooldown diab.event run data get storage diabolical:events diabolical_night.cooldown_ticks

tag @a remove diab.event_target
tag @a remove diab.event_survivor
tag @a remove diab.event_forced
function diabolical:events/target/refresh_diabolical_night
function diabolical:events/director/profile_diabolical_night
execute as @a[tag=diab.event_target] run advancement grant @s only diabolical:events/diabolical_night

tellraw @a [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Diabolical Night begins. Heavy debtors and stained souls draw hostile attention.","color":"gray"}]
execute if score #event.profile diab.event matches 2 run tellraw @a [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Night profile: severe balances. Hostile pressure increases around marked players.","color":"gray"}]
execute if score #event.profile diab.event matches 3.. run tellraw @a [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Night profile: infernal balances. The ledger has escalated the hunt.","color":"red"}]
title @a subtitle {"text":"The ledger hunts open balances.","color":"gray"}
title @a title {"text":"Diabolical Night","color":"dark_red","bold":true}
execute as @a at @s run playsound minecraft:block.bell.use master @s ~ ~ ~ 0.8 0.6
execute as @a at @s run particle minecraft:soul_fire_flame ~ ~1 ~ 0.5 0.4 0.5 0.02 24 force @s
execute as @a[tag=diab.event_target] at @s run particle minecraft:ash ~ ~1 ~ 0.8 0.5 0.8 0.02 28 force @s
execute if score #event.profile diab.event matches 2.. as @a[tag=diab.event_target] at @s run particle minecraft:soul ~ ~1 ~ 0.7 0.4 0.7 0.01 16 force @s
execute if score #event.profile diab.event matches 3.. as @a[tag=diab.event_target] at @s run particle minecraft:soul ~ ~1 ~ 0.9 0.5 0.9 0.02 24 force @s
