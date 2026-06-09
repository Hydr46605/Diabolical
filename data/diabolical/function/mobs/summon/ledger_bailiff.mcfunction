# Summons a Ledger Bailiff for players with debt and sin together.
data merge storage diabolical:mobs {active:"ledger_bailiff",last_result:"ledger_bailiff_started"}
scoreboard players set #court.active diab.mob 1
scoreboard players set #court.kind diab.mob 3
scoreboard players set #court.timer diab.mob 1000
execute store result score #court.bailiff_cd diab.mob run data get storage diabolical:mobs cooldowns.bailiff

tag @a remove diab.court_target
tag @s add diab.court_target
scoreboard players operation #court.kills diab.mob = @s diab.kills
kill @e[tag=diab.court_mob]

execute at @s run summon minecraft:skeleton ~ ~ ~ {Tags:["diab.court_mob","diab.mob.ledger_bailiff"],CustomName:'{"text":"Ledger Bailiff","color":"dark_red","bold":true}',PersistenceRequired:1b}
execute at @s as @e[tag=diab.mob.ledger_bailiff,distance=..4,limit=1,sort=nearest] run effect give @s minecraft:strength 120 0 true
execute at @s as @e[tag=diab.mob.ledger_bailiff,distance=..4,limit=1,sort=nearest] run effect give @s minecraft:resistance 120 0 true
execute at @s as @e[tag=diab.mob.ledger_bailiff,distance=..4,limit=1,sort=nearest] run effect give @s minecraft:glowing 120 0 true

tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"A Ledger Bailiff serves notice for mixed sin and debt.","color":"gray"}]
title @s actionbar {"text":"Ledger Bailiff dispatched.","color":"dark_red"}
execute at @s run playsound minecraft:block.bell.use master @s ~ ~ ~ 0.8 0.5
execute at @s run particle minecraft:ash ~ ~1 ~ 0.9 0.6 0.9 0.02 30 force @s
