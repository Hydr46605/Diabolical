# Ashen Charm passively saves the selected holder from immediate fire danger.
tag @s add diab.relic_holder

execute if score @s diab.cooldown matches 0 if block ~ ~ ~ minecraft:lava run function diabolical:relics/use/apply/ashen_charm
execute if score @s diab.cooldown matches 0 if block ~ ~ ~ minecraft:fire run function diabolical:relics/use/apply/ashen_charm
execute if score @s diab.cooldown matches 0 if block ~ ~ ~ minecraft:soul_fire run function diabolical:relics/use/apply/ashen_charm
