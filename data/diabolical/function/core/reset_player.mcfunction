# Resets the executing player's Diabolical state without uninstalling the pack.
tag @s add diab.player
tag @s remove diab.debug
tag @s remove diab.contracts_unlocked
tag @s remove diab.contracts_major_unlocked
tag @s remove diab.contract_active
tag @s remove diab.contract.pact_of_embers
tag @s remove diab.contract.pact_of_hunger
tag @s remove diab.contract.red_ledger_minor
tag @s remove diab.contract.pact_of_copper
tag @s remove diab.contract.greed_clause
tag @s remove diab.contract.the_red_ledger
tag @s remove diab.relic_holder
tag @s remove diab.event_target
tag @s remove diab.event_survivor
tag @s remove diab.event_forced
tag @s remove diab.collector_target
tag @s remove diab.court_target

scoreboard players set @s diab.sin 0
scoreboard players set @s diab.debt 0
scoreboard players set @s diab.cooldown 0
scoreboard players set @s diab.rcharge 0
scoreboard players set @s diab.contract 0
scoreboard players set @s diab.cdebt 0
scoreboard players set @s diab.ledger 0
scoreboard players set @s diab.page 0
scoreboard players set @s diab.accept 0
scoreboard players set @s diab.pay 0
scoreboard players set @s diab.revoke 0
scoreboard players set @s diab.relic 0
scoreboard players set @s diab.court 0
scoreboard players set @s diab.kills 0
scoreboard players set @s diab.kwither 0
scoreboard players set @s diab.kphantom 0
scoreboard players set @s diab.kwitch 0
scoreboard players set @s diab.kzombie 0
