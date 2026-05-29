# Cracks one Awakened Hellbound Compass back into a normal Hellbound Compass.
scoreboard players set #relic.break diab.tmp 0
execute store result score #relic.break diab.tmp run clear @s minecraft:recovery_compass[minecraft:custom_data={diabolical:{relic:"awakened_hellbound_compass"}}] 1
execute if score #relic.break diab.tmp matches 1.. run scoreboard players set @s diab.rcharge 0
execute if score #relic.break diab.tmp matches 1.. run function diabolical:relics/give/hellbound_compass
execute if score #relic.break diab.tmp matches 1.. run tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"The awakened compass cracks back into a Hellbound Compass.","color":"gray"}]
execute unless score #relic.break diab.tmp matches 1.. run tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"No Awakened Hellbound Compass was found to break.","color":"gray"}]
scoreboard players reset #relic.break diab.tmp
