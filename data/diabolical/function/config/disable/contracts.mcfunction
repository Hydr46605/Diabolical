# Disables contract menus and contract tick effects.
scoreboard players set #contracts diab.config 0
data merge storage diabolical:config {systems:{contracts:0b}}
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Contracts disabled.","color":"gray"}]
