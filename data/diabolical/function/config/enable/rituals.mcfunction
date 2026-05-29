# Enables ritual trigger scans.
scoreboard players set #rituals diab.config 1
data merge storage diabolical:config {systems:{rituals:1b}}
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Rituals enabled.","color":"gray"}]
