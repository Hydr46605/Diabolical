# Rewards the collector target when the active collector is defeated.
execute as @a[tag=diab.collector_target] run advancement grant @s only diabolical:events/debt_collector
execute as @a[tag=diab.collector_target] run function diabolical:advancements/check/collector_mastery
execute as @a[tag=diab.collector_target] run function diabolical:events/reward/apply/debt_collector
function diabolical:events/stop/debt_collector
