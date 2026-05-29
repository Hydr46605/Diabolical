# Applies controlled backlash for risky cleansing-ritual failures.
data merge storage diabolical:events {director:{last_backlash:"ritual_minor"}}
execute store result score #backlash.cooldown diab.event run data get storage diabolical:events director.backlash_cooldown_ticks
scoreboard players set #amount diab.tmp 1
function diabolical:core/add_debt
effect give @s minecraft:weakness 8 0 true
effect give @s minecraft:darkness 4 0 true
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Backlash records one extra debt. No blocks were claimed.","color":"gray"}]
playsound minecraft:block.soul_sand.break master @s ~ ~ ~ 0.5 0.7
particle minecraft:ash ~ ~1 ~ 0.6 0.4 0.6 0.02 18 force @s
scoreboard players reset #amount diab.tmp
