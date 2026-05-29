# Enables event tick routing and natural event triggers.
scoreboard players set #events diab.config 1
data merge storage diabolical:config {systems:{events:1b}}
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Events enabled.","color":"gray"}]
