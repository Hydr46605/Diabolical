# Applies controlled backlash for a failed Red Moon Invitation.
data merge storage diabolical:events {director:{last_backlash:"red_moon_invitation"}}
execute store result score #backlash.cooldown diab.event run data get storage diabolical:events director.backlash_cooldown_ticks
scoreboard players set #amount diab.tmp 1
function diabolical:core/add_sin
scoreboard players set #amount diab.tmp 3
function diabolical:core/add_debt
effect give @s minecraft:darkness 8 0 true
effect give @s minecraft:weakness 12 0 true
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"The failed invitation leaves a stain and a small balance. The world remains intact.","color":"gray"}]
playsound minecraft:entity.wither.ambient master @s ~ ~ ~ 0.35 1.4
particle minecraft:soul_fire_flame ~ ~1 ~ 0.7 0.5 0.7 0.03 24 force @s
scoreboard players reset #amount diab.tmp
