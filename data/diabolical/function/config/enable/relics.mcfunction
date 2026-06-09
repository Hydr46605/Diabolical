# Enables relic use routing and selected-item relic ticks.
scoreboard players set #relics diab.config 1
data merge storage diabolical:config {systems:{relics:1b}}
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Relics enabled.","color":"gray"}]
