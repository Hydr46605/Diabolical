# Aggregates current online sin and debt pressure.
scoreboard players set #director.debt diab.event 0
scoreboard players set #director.sin diab.event 0
scoreboard players set #director.players diab.event 0
execute as @a run scoreboard players add #director.players diab.event 1
execute as @a run scoreboard players operation #director.debt diab.event += @s diab.debt
execute as @a run scoreboard players operation #director.sin diab.event += @s diab.sin
execute store result storage diabolical:events director.last_pressure.debt int 1 run scoreboard players get #director.debt diab.event
execute store result storage diabolical:events director.last_pressure.sin int 1 run scoreboard players get #director.sin diab.event
execute store result storage diabolical:events director.last_pressure.players int 1 run scoreboard players get #director.players diab.event
