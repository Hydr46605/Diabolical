# Coordinates natural event pressure and warning cadence.
function diabolical:events/director/refresh_pressure

execute unless score #event.active diab.event matches 1 unless score #audit.cooldown diab.event matches 1.. if score #director.debt diab.event >= #audit.target_debt diab.event run function diabolical:events/director/infernal_audit
execute unless score #event.active diab.event matches 1 unless score #audit.cooldown diab.event matches 1.. if score #director.sin diab.event >= #audit.target_sin diab.event run function diabolical:events/director/infernal_audit
execute unless score #event.active diab.event matches 1 unless score #collector.active diab.event matches 1 unless score #collector.cooldown diab.event matches 1.. as @a[scores={diab.debt=50..},limit=1,sort=random] run function diabolical:events/start/debt_collector
