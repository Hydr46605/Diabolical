# Diabolical tick hook. Keep this thin; route heavy work to scheduled/module functions.
execute if data storage diabolical:runtime enabled run scoreboard players add #runtime diab.tick 1
execute if data storage diabolical:runtime enabled as @a[scores={diab.cooldown=1..}] run scoreboard players remove @s diab.cooldown 1
execute if data storage diabolical:runtime enabled as @a[tag=!diab.player] run function diabolical:core/player_init
execute if data storage diabolical:runtime enabled run function diabolical:actions/tick
execute if data storage diabolical:runtime enabled if score #rituals diab.config matches 1 run function diabolical:rituals/tick
execute if data storage diabolical:runtime enabled if score #contracts diab.config matches 1 run function diabolical:contracts/tick
execute if data storage diabolical:runtime enabled if score #relics diab.config matches 1 run function diabolical:relics/tick
execute if data storage diabolical:runtime enabled if score #events diab.config matches 1 run function diabolical:events/tick
