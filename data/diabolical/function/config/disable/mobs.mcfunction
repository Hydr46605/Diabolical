# Disables Sinbound Court mobs and clears active court encounters.
execute if score #court.active diab.mob matches 1 run function diabolical:mobs/stop/active
scoreboard players set #mobs diab.config 0
data merge storage diabolical:config {systems:{mobs:0b}}
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Sinbound Court mobs disabled.","color":"gray"}]
