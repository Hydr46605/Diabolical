# Disables relic use routing and selected-item relic ticks.
scoreboard players set #relics diab.config 0
data merge storage diabolical:config {systems:{relics:0b}}
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Relics disabled.","color":"gray"}]
