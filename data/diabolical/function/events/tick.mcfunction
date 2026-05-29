# Event router.
execute if score #diabolical_night.cooldown diab.event matches 1.. run scoreboard players remove #diabolical_night.cooldown diab.event 1
execute if score #collector.cooldown diab.event matches 1.. run scoreboard players remove #collector.cooldown diab.event 1
execute if score #audit.cooldown diab.event matches 1.. run scoreboard players remove #audit.cooldown diab.event 1
execute if score #backlash.cooldown diab.event matches 1.. run scoreboard players remove #backlash.cooldown diab.event 1
function diabolical:events/director/tick
execute if score #event.active diab.event matches 1 run function diabolical:events/tick/diabolical_night
execute if score #collector.active diab.event matches 1 run function diabolical:events/tick/debt_collector
