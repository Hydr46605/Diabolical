# Stops Diabolical Night and clears temporary event state.
execute if score #event.active diab.event matches 1 as @a[tag=diab.event_survivor] run function diabolical:events/reward/diabolical_night
execute if score #event.active diab.event matches 1 run tellraw @a [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Diabolical Night ends. The ledger grows quiet.","color":"gray"}]
execute if score #event.active diab.event matches 1 run title @a actionbar {"text":"The night releases its claim.","color":"gray"}
execute if score #event.active diab.event matches 1 as @a at @s run playsound minecraft:block.bell.use master @s ~ ~ ~ 0.6 1.2

data merge storage diabolical:events {active:"none",last_result:"diabolical_night_stopped"}
scoreboard players set #event.active diab.event 0
scoreboard players set #diabolical_night diab.event 0
scoreboard players set #event.profile diab.event 0
tag @a remove diab.event_target
tag @a remove diab.event_survivor
tag @a remove diab.event_forced
