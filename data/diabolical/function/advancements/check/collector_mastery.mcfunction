# Grants collector mastery once the player has seen audit pressure and defeated a collector.
execute if entity @s[advancements={diabolical:events/infernal_audit=true,diabolical:events/debt_collector=true}] run advancement grant @s only diabolical:mastery/collector_mastery
