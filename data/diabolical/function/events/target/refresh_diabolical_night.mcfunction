# Refreshes current Diabolical Night targets from Phase 8 thresholds.
tag @a remove diab.event_target
execute as @a if score @s diab.debt >= #event.target_debt diab.event run tag @s add diab.event_target
execute as @a if score @s diab.sin >= #event.target_sin diab.event run tag @s add diab.event_target
tag @a[tag=diab.event_forced] add diab.event_target
tag @a[tag=diab.event_target] add diab.event_survivor
