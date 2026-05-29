# Events module bootstrap.
data merge storage diabolical:events {version:"0.4.0-dev",phase:22,active_ids:["diabolical_night","debt_collector","infernal_audit"],diabolical_night:{duration_ticks:900,reward_debt_payment:4,cooldown_ticks:6000,target_debt_min:8,target_sin_min:25,trigger:"red_ledger_minor"},debt_collector:{duration_ticks:1200,reward_debt_payment:8,cooldown_ticks:6000,target_debt_min:50,severe_debt_min:100,trigger:"severe_debt"},director:{enabled:1b,audit_cooldown_ticks:2400,audit_debt_min:120,audit_sin_min:90,backlash_cooldown_ticks:200,last_warning:"none",last_backlash:"none",last_pressure:{debt:0,sin:0,players:0}}}

scoreboard players add #event.active diab.event 0
scoreboard players add #diabolical_night diab.event 0
scoreboard players add #diabolical_night.cooldown diab.event 0
scoreboard players add #event.profile diab.event 0
scoreboard players add #collector.active diab.event 0
scoreboard players add #collector.timer diab.event 0
scoreboard players add #collector.cooldown diab.event 0
scoreboard players add #collector.kills diab.event 0
scoreboard players add #audit.cooldown diab.event 0
scoreboard players add #backlash.cooldown diab.event 0
scoreboard players add #director.debt diab.event 0
scoreboard players add #director.sin diab.event 0
scoreboard players add #director.players diab.event 0
execute store result score #event.target_debt diab.event run data get storage diabolical:events diabolical_night.target_debt_min
execute store result score #event.target_sin diab.event run data get storage diabolical:events diabolical_night.target_sin_min
execute store result score #collector.target_debt diab.event run data get storage diabolical:events debt_collector.target_debt_min
execute store result score #collector.severe_debt diab.event run data get storage diabolical:events debt_collector.severe_debt_min
execute store result score #audit.target_debt diab.event run data get storage diabolical:events director.audit_debt_min
execute store result score #audit.target_sin diab.event run data get storage diabolical:events director.audit_sin_min
execute unless score #event.active diab.event matches 1 run data merge storage diabolical:events {active:"none",last_result:"idle"}
