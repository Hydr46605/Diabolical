# Stops the active Debt Collector encounter and clears temporary state.
data merge storage diabolical:events {debt_collector:{last_result:"stopped"}}
scoreboard players set #collector.active diab.event 0
scoreboard players set #collector.timer diab.event 0
scoreboard players set #collector.kills diab.event 0
kill @e[tag=diab.collector_guard]
tag @a remove diab.collector_target
