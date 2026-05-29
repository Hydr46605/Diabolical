# Validates the Infernal Altar beneath the trigger item.
tag @s add diab.ritual_trigger

scoreboard players set #ritual.cooldown diab.tmp 0
execute as @a[distance=..8,limit=1,sort=nearest] if score @s diab.cooldown matches 1.. run scoreboard players set #ritual.cooldown diab.tmp 1

execute if score #ritual.cooldown diab.tmp matches 0 run function diabolical:rituals/check/altar_pattern

tag @s remove diab.ritual_trigger
scoreboard players reset #ritual.cooldown diab.tmp
