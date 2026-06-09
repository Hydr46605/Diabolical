# Disables ritual trigger scans.
scoreboard players set #rituals diab.config 0
data merge storage diabolical:config {systems:{rituals:0b}}
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Rituals disabled.","color":"gray"}]
