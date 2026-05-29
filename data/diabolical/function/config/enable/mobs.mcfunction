# Enables Sinbound Court mob routing and court item controls.
scoreboard players set #mobs diab.config 1
data merge storage diabolical:config {systems:{mobs:1b}}
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Sinbound Court mobs enabled.","color":"gray"}]
