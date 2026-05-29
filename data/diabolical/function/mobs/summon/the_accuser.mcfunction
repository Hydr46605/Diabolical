# Summons The Accuser, the Sinbound Court's capstone hunter.
data merge storage diabolical:mobs {active:"the_accuser",last_result:"the_accuser_started"}
scoreboard players set #court.active diab.mob 1
scoreboard players set #court.kind diab.mob 5
scoreboard players set #court.timer diab.mob 1600
execute store result score #court.accuser_cd diab.mob run data get storage diabolical:mobs cooldowns.accuser

tag @a remove diab.court_target
tag @s add diab.court_target
scoreboard players operation #court.kills diab.mob = @s diab.kwither
kill @e[tag=diab.court_mob]

execute at @s run summon minecraft:wither_skeleton ~ ~ ~ {Tags:["diab.court_mob","diab.mob.the_accuser"],CustomName:'{"text":"The Accuser","color":"dark_red","bold":true}',PersistenceRequired:1b}
execute at @s as @e[tag=diab.mob.the_accuser,distance=..4,limit=1,sort=nearest] run effect give @s minecraft:strength 180 1 true
execute at @s as @e[tag=diab.mob.the_accuser,distance=..4,limit=1,sort=nearest] run effect give @s minecraft:resistance 180 1 true
execute at @s as @e[tag=diab.mob.the_accuser,distance=..4,limit=1,sort=nearest] run effect give @s minecraft:fire_resistance 180 0 true
execute at @s as @e[tag=diab.mob.the_accuser,distance=..4,limit=1,sort=nearest] run effect give @s minecraft:glowing 180 0 true

tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"The Accuser steps out of the ledger. Your sins are being counted aloud.","color":"gray"}]
title @s subtitle {"text":"The court has accepted your case.","color":"gray"}
title @s title {"text":"The Accuser","color":"dark_red","bold":true}
execute at @s run playsound minecraft:entity.wither.spawn master @s ~ ~ ~ 0.6 1.4
execute at @s run particle minecraft:soul_fire_flame ~ ~1.2 ~ 1.2 0.8 1.2 0.04 60 force @s
execute at @s run particle minecraft:ash ~ ~1.2 ~ 1.0 0.7 1.0 0.02 40 force @s
