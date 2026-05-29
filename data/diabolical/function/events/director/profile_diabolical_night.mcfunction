# Chooses a Diabolical Night profile from current online pressure.
scoreboard players set #event.profile diab.event 1
execute if entity @a[scores={diab.debt=50..}] run scoreboard players set #event.profile diab.event 2
execute if entity @a[scores={diab.sin=75..}] run scoreboard players set #event.profile diab.event 2
execute if entity @a[scores={diab.debt=100..}] run scoreboard players set #event.profile diab.event 3
execute if entity @a[scores={diab.sin=150..}] run scoreboard players set #event.profile diab.event 3
execute store result storage diabolical:events diabolical_night.profile int 1 run scoreboard players get #event.profile diab.event
