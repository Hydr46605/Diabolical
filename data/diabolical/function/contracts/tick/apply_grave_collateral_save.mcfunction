# Applies one Grave Collateral emergency save.
effect give @s minecraft:absorption 8 1 true
effect give @s minecraft:resistance 6 1 true
effect give @s minecraft:regeneration 5 1 true
scoreboard players set #amount diab.tmp 6
function diabolical:core/add_debt
scoreboard players set #amount diab.tmp 2
function diabolical:core/add_sin
scoreboard players set @s diab.gravecd 600
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Grave Collateral paid for breath. The account deepens.","color":"gray"}]
