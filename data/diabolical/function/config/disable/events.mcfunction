# Disables event tick routing and natural event triggers.
execute if score #event.active diab.event matches 1 run function diabolical:events/stop/diabolical_night
execute if score #collector.active diab.event matches 1 run function diabolical:events/stop/debt_collector
scoreboard players set #events diab.config 0
data merge storage diabolical:config {systems:{events:0b}}
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Events disabled.","color":"gray"}]
