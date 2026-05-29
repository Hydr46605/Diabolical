# Validates exact Red Moon Invitation offerings near the altar.
scoreboard players set #ritual.inputs diab.tmp 1
scoreboard players set #ritual.event_ready diab.tmp 0

execute unless entity @s[nbt={Item:{id:"minecraft:wither_rose",count:1}}] run scoreboard players set #ritual.inputs diab.tmp 0
execute unless entity @e[type=item,distance=..1.25,nbt={Item:{id:"minecraft:rotten_flesh",count:1}},limit=1] run scoreboard players set #ritual.inputs diab.tmp 0
execute unless entity @e[type=item,distance=..1.25,nbt={Item:{id:"minecraft:redstone",count:1}},limit=1] run scoreboard players set #ritual.inputs diab.tmp 0
execute if score #events diab.config matches 1 unless score #event.active diab.event matches 1 unless score #collector.active diab.event matches 1 unless score #diabolical_night.cooldown diab.event matches 1.. run scoreboard players set #ritual.event_ready diab.tmp 1
execute unless score #ritual.event_ready diab.tmp matches 1 run scoreboard players set #ritual.inputs diab.tmp 0

execute if score #ritual.inputs diab.tmp matches 1 run function diabolical:rituals/start/red_moon_invitation
execute unless score #ritual.inputs diab.tmp matches 1 run function diabolical:rituals/fail/red_moon_invitation
