# Debug entry point for starting a Ledger Bailiff encounter on the executor.
scoreboard players set #court.bailiff_cd diab.mob 0
execute if score #court.active diab.mob matches 1 run function diabolical:mobs/use/fail_active
execute unless score #court.active diab.mob matches 1 run function diabolical:mobs/summon/ledger_bailiff
