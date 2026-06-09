# Starts Diabolical Night unless another event is active.
execute unless score #events diab.config matches 1 run function diabolical:events/start/fail_disabled
execute if score #events diab.config matches 1 if score #event.active diab.event matches 1 run function diabolical:events/start/fail_active
execute if score #events diab.config matches 1 unless score #event.active diab.event matches 1 if score #collector.active diab.event matches 1 run function diabolical:events/start/fail_active
execute if score #events diab.config matches 1 unless score #event.active diab.event matches 1 unless score #collector.active diab.event matches 1 if score #diabolical_night.cooldown diab.event matches 1.. run function diabolical:events/start/fail_cooldown
execute if score #events diab.config matches 1 unless score #event.active diab.event matches 1 unless score #collector.active diab.event matches 1 unless score #diabolical_night.cooldown diab.event matches 1.. run function diabolical:events/start/apply/diabolical_night
