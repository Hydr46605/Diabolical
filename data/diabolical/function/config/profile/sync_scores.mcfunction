# Synchronizes score-backed gates from the active profile storage.
execute store result score #event.target_debt diab.event run data get storage diabolical:events diabolical_night.target_debt_min
execute store result score #event.target_sin diab.event run data get storage diabolical:events diabolical_night.target_sin_min
execute store result score #collector.target_debt diab.event run data get storage diabolical:events debt_collector.target_debt_min
execute store result score #collector.severe_debt diab.event run data get storage diabolical:events debt_collector.severe_debt_min
execute store result score #audit.target_debt diab.event run data get storage diabolical:events director.audit_debt_min
execute store result score #audit.target_sin diab.event run data get storage diabolical:events director.audit_sin_min
execute store result score #court.imp_sin diab.mob run data get storage diabolical:mobs thresholds.imp_sin_min
execute store result score #court.wraith_sin diab.mob run data get storage diabolical:mobs thresholds.wraith_sin_min
execute store result score #court.bailiff_debt diab.mob run data get storage diabolical:mobs thresholds.bailiff_debt_min
execute store result score #court.bailiff_sin diab.mob run data get storage diabolical:mobs thresholds.bailiff_sin_min
execute store result score #court.accuser_sin diab.mob run data get storage diabolical:mobs thresholds.accuser_sin_min
