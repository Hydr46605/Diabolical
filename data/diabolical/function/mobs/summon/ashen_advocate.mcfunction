# Summons an Ashen Advocate as a deliberate court trial.
data merge storage diabolical:mobs {active:"ashen_advocate",last_result:"ashen_advocate_started"}
scoreboard players set #court.active diab.mob 1
scoreboard players set #court.kind diab.mob 4
scoreboard players set #court.timer diab.mob 900
execute store result score #court.advocate_cd diab.mob run data get storage diabolical:mobs cooldowns.advocate

tag @a remove diab.court_target
tag @s add diab.court_target
scoreboard players operation #court.kills diab.mob = @s diab.kwitch
kill @e[tag=diab.court_mob]

execute at @s run summon minecraft:witch ~ ~ ~ {Tags:["diab.court_mob","diab.mob.ashen_advocate"],CustomName:'{"text":"Ashen Advocate","color":"dark_purple","bold":true}',PersistenceRequired:1b}
execute at @s as @e[tag=diab.mob.ashen_advocate,distance=..4,limit=1,sort=nearest] run effect give @s minecraft:resistance 120 0 true
execute at @s as @e[tag=diab.mob.ashen_advocate,distance=..4,limit=1,sort=nearest] run effect give @s minecraft:fire_resistance 120 0 true
execute at @s as @e[tag=diab.mob.ashen_advocate,distance=..4,limit=1,sort=nearest] run effect give @s minecraft:glowing 120 0 true

tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"An Ashen Advocate arrives to argue against remission.","color":"gray"}]
title @s actionbar {"text":"Ashen Advocate called.","color":"dark_purple"}
execute at @s run playsound minecraft:entity.witch.celebrate master @s ~ ~ ~ 0.7 0.8
execute at @s run particle minecraft:witch ~ ~1 ~ 0.7 0.5 0.7 0.03 28 force @s
