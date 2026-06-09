# Removes Diabolical runtime state from the current world.
execute if score #event.active diab.event matches 1 run function diabolical:events/stop/diabolical_night
execute if score #collector.active diab.event matches 1 run function diabolical:events/stop/debt_collector
execute if score #court.active diab.mob matches 1 run function diabolical:mobs/stop/active
schedule clear diabolical:core/heartbeat

scoreboard objectives remove diab.tick
scoreboard objectives remove diab.sin
scoreboard objectives remove diab.debt
scoreboard objectives remove diab.cooldown
scoreboard objectives remove diab.rcharge
scoreboard objectives remove diab.contract
scoreboard objectives remove diab.cdebt
scoreboard objectives remove diab.event
scoreboard objectives remove diab.mob
scoreboard objectives remove diab.tmp
scoreboard objectives remove diab.config
scoreboard objectives remove diab.kills
scoreboard objectives remove diab.kwither
scoreboard objectives remove diab.kphantom
scoreboard objectives remove diab.kwitch
scoreboard objectives remove diab.kzombie
scoreboard objectives remove diab.ledger
scoreboard objectives remove diab.page
scoreboard objectives remove diab.accept
scoreboard objectives remove diab.pay
scoreboard objectives remove diab.revoke
scoreboard objectives remove diab.relic
scoreboard objectives remove diab.court

data remove storage diabolical:config version
data remove storage diabolical:config debug
data remove storage diabolical:config profile
data remove storage diabolical:config profile_id
data remove storage diabolical:config systems

data remove storage diabolical:runtime enabled
data remove storage diabolical:runtime version
data remove storage diabolical:runtime phase
data remove storage diabolical:runtime heartbeat

data remove storage diabolical:contracts version
data remove storage diabolical:contracts phase
data remove storage diabolical:contracts active_ids
data remove storage diabolical:contracts tiers

data remove storage diabolical:relics version
data remove storage diabolical:relics phase
data remove storage diabolical:relics active_ids
data remove storage diabolical:relics charge_conventions
data remove storage diabolical:relics charges

data remove storage diabolical:events version
data remove storage diabolical:events phase
data remove storage diabolical:events active
data remove storage diabolical:events active_ids
data remove storage diabolical:events last_result
data remove storage diabolical:events diabolical_night
data remove storage diabolical:events debt_collector
data remove storage diabolical:events director

data remove storage diabolical:mobs version
data remove storage diabolical:mobs phase
data remove storage diabolical:mobs update
data remove storage diabolical:mobs active
data remove storage diabolical:mobs active_ids
data remove storage diabolical:mobs thresholds
data remove storage diabolical:mobs cooldowns
data remove storage diabolical:mobs rewards
data remove storage diabolical:mobs last_result

data remove storage diabolical:rituals version
data remove storage diabolical:rituals phase
data remove storage diabolical:rituals framework
data remove storage diabolical:rituals last_result

tag @a remove diab.player
tag @a remove diab.debug
tag @a remove diab.contracts_unlocked
tag @a remove diab.contracts_major_unlocked
tag @a remove diab.contract_active
tag @a remove diab.contract.pact_of_embers
tag @a remove diab.contract.pact_of_hunger
tag @a remove diab.contract.red_ledger_minor
tag @a remove diab.contract.pact_of_copper
tag @a remove diab.contract.greed_clause
tag @a remove diab.contract.the_red_ledger
tag @a remove diab.relic_holder
tag @a remove diab.event_target
tag @a remove diab.event_survivor
tag @a remove diab.event_forced
tag @a remove diab.collector_target
tag @a remove diab.court_target

tag @e[tag=diab.ritual_trigger] remove diab.ritual_trigger
tag @e[tag=diab.altar_item] remove diab.altar_item
kill @e[tag=diab.collector_guard]
kill @e[tag=diab.court_mob]

tellraw @a [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Runtime state removed. Disable the data pack before reloading if you are uninstalling it.","color":"gray"}]
