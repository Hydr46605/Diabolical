# Debug entry point for starting a Contract Imp encounter on the executor.
scoreboard players set #court.imp_cd diab.mob 0
execute if score #court.active diab.mob matches 1 run function diabolical:mobs/use/fail_active
execute unless score #court.active diab.mob matches 1 run function diabolical:mobs/summon/contract_imp
