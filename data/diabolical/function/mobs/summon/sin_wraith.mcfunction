# Summons a Sin Wraith for condemned players.
data merge storage diabolical:mobs {active:"sin_wraith",last_result:"sin_wraith_started"}
scoreboard players set #court.active diab.mob 1
scoreboard players set #court.kind diab.mob 2
scoreboard players set #court.timer diab.mob 900
execute store result score #court.wraith_cd diab.mob run data get storage diabolical:mobs cooldowns.wraith

tag @a remove diab.court_target
tag @s add diab.court_target
scoreboard players operation #court.kills diab.mob = @s diab.kphantom
kill @e[tag=diab.court_mob]

execute at @s run summon minecraft:phantom ~ ~4 ~ {Tags:["diab.court_mob","diab.mob.sin_wraith"],CustomName:'{"text":"Sin Wraith","color":"dark_purple","bold":true}',Size:1,PersistenceRequired:1b}
execute at @s as @e[tag=diab.mob.sin_wraith,distance=..8,limit=1,sort=nearest] run effect give @s minecraft:speed 120 1 true
execute at @s as @e[tag=diab.mob.sin_wraith,distance=..8,limit=1,sort=nearest] run effect give @s minecraft:glowing 120 0 true

tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"A Sin Wraith has found the stain in your name.","color":"gray"}]
title @s actionbar {"text":"Sin Wraith above you.","color":"dark_purple"}
execute at @s run playsound minecraft:entity.phantom.swoop master @s ~ ~ ~ 0.8 0.6
execute at @s run particle minecraft:soul_fire_flame ~ ~1.4 ~ 0.8 0.8 0.8 0.02 28 force @s
