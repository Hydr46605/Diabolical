# Debug entry point for starting an Ashen Advocate encounter on the executor.
scoreboard players set #court.advocate_cd diab.mob 0
execute if score #court.active diab.mob matches 1 run function diabolical:mobs/use/fail_active
execute unless score #court.active diab.mob matches 1 run function diabolical:mobs/summon/ashen_advocate
