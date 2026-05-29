# Debug entry point for starting a Debt Collector encounter on the executor.
scoreboard players set #collector.cooldown diab.event 0
execute if score #event.active diab.event matches 1 run function diabolical:events/start/fail_active
execute unless score #event.active diab.event matches 1 if score #collector.active diab.event matches 1 run function diabolical:events/start/fail_active
execute unless score #event.active diab.event matches 1 unless score #collector.active diab.event matches 1 run function diabolical:events/start/apply/debt_collector
