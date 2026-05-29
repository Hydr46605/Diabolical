# Applies the Hellbound Compass awakening rite.
clear @s minecraft:recovery_compass[minecraft:custom_data={diabolical:{relic:"hellbound_compass"}}] 1
clear @s minecraft:echo_shard 1
clear @s minecraft:amethyst_shard 3
clear @s minecraft:redstone 4
function diabolical:relics/give/awakened_hellbound_compass
scoreboard players set @s diab.cooldown 100
advancement grant @s only diabolical:relics/first_relic
advancement grant @s only diabolical:relics/hellbound_compass
advancement grant @s only diabolical:relics/awakened_hellbound_compass
function diabolical:advancements/check/starter_relics
function diabolical:advancements/check/recovery_mastery
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"The compass wakes with three charges.","color":"gray"}]
