# Grave Collateral: emergency save when health is low.
execute if score @s diab.gravecd matches 1.. run scoreboard players remove @s diab.gravecd 1
execute store result score @s diab.hp run data get entity @s Health 10
execute if score @s diab.hp matches ..60 if score @s diab.gravecd matches ..0 run function diabolical:contracts/tick/apply_grave_collateral_save
