# Enables contract menus and contract tick effects.
scoreboard players set #contracts diab.config 1
data merge storage diabolical:config {systems:{contracts:1b}}
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Contracts enabled.","color":"gray"}]
