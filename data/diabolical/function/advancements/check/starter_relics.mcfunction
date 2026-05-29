# Grants the starter-relic mastery challenge once all starter relics were used.
execute if entity @s[advancements={diabolical:relics/ashen_charm=true,diabolical:relics/midas_coin=true,diabolical:relics/hellbound_compass=true}] run advancement grant @s only diabolical:mastery/starter_relics
