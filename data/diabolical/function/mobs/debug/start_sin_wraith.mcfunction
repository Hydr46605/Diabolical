# Debug entry point for starting a Sin Wraith encounter on the executor.
scoreboard players set #court.wraith_cd diab.mob 0
execute if score #court.active diab.mob matches 1 run function diabolical:mobs/use/fail_active
execute unless score #court.active diab.mob matches 1 run function diabolical:mobs/summon/sin_wraith
