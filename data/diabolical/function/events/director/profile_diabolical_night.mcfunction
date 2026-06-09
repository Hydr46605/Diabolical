# Chooses a Diabolical Night profile from current online pressure.
scoreboard players set #event.profile diab.event 1
execute as @a if score @s diab.debt >= #collector.target_debt diab.event run scoreboard players set #event.profile diab.event 2
execute as @a if score @s diab.sin >= #court.wraith_sin diab.mob run scoreboard players set #event.profile diab.event 2
execute as @a if score @s diab.debt >= #collector.severe_debt diab.event run scoreboard players set #event.profile diab.event 3
execute as @a if score @s diab.sin >= #court.accuser_sin diab.mob run scoreboard players set #event.profile diab.event 3
execute store result storage diabolical:events diabolical_night.profile int 1 run scoreboard players get #event.profile diab.event
