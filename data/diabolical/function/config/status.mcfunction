# Prints current Diabolical system config.
tellraw @s [{"text":"Diabolical config","color":"dark_red","bold":true}]
tellraw @s [{"text":"Contracts: ","color":"gray"},{"score":{"name":"#contracts","objective":"diab.config"},"color":"white"},{"text":"  Rituals: ","color":"gray"},{"score":{"name":"#rituals","objective":"diab.config"},"color":"white"}]
tellraw @s [{"text":"Relics: ","color":"gray"},{"score":{"name":"#relics","objective":"diab.config"},"color":"white"},{"text":"  Events: ","color":"gray"},{"score":{"name":"#events","objective":"diab.config"},"color":"white"},{"text":"  Mobs: ","color":"gray"},{"score":{"name":"#mobs","objective":"diab.config"},"color":"white"}]
tellraw @s [{"text":"1 means enabled, 0 means disabled.","color":"gray"}]
