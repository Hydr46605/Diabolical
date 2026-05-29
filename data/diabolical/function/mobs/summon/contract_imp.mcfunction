# Summons a low-tier Contract Imp for stained players.
data merge storage diabolical:mobs {active:"contract_imp",last_result:"contract_imp_started"}
scoreboard players set #court.active diab.mob 1
scoreboard players set #court.kind diab.mob 1
scoreboard players set #court.timer diab.mob 600
execute store result score #court.imp_cd diab.mob run data get storage diabolical:mobs cooldowns.imp

tag @a remove diab.court_target
tag @s add diab.court_target
scoreboard players operation #court.kills diab.mob = @s diab.kzombie
kill @e[tag=diab.court_mob]

execute at @s run summon minecraft:zombie ~ ~ ~ {Tags:["diab.court_mob","diab.mob.contract_imp"],CustomName:'{"text":"Contract Imp","color":"gold","bold":true}',IsBaby:1b,PersistenceRequired:1b}
execute at @s as @e[tag=diab.mob.contract_imp,distance=..4,limit=1,sort=nearest] run effect give @s minecraft:speed 120 0 true
execute at @s as @e[tag=diab.mob.contract_imp,distance=..4,limit=1,sort=nearest] run effect give @s minecraft:glowing 120 0 true

tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"A Contract Imp scrapes at the edge of your signature.","color":"gray"}]
title @s actionbar {"text":"The Sinbound Court sends an imp.","color":"gold"}
execute at @s run playsound minecraft:entity.illusioner.prepare_blindness master @s ~ ~ ~ 0.5 1.6
execute at @s run particle minecraft:ash ~ ~1 ~ 0.7 0.5 0.7 0.02 22 force @s
