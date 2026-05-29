# Validates exact First Signature offerings near the altar.
scoreboard players set #ritual.inputs diab.tmp 1
execute unless entity @s[nbt={Item:{id:"minecraft:paper",count:1}}] run scoreboard players set #ritual.inputs diab.tmp 0
execute unless entity @e[type=item,distance=..1.25,nbt={Item:{id:"minecraft:ink_sac",count:1}},limit=1] run scoreboard players set #ritual.inputs diab.tmp 0
execute unless entity @e[type=item,distance=..1.25,nbt={Item:{id:"minecraft:gold_nugget",count:1}},limit=1] run scoreboard players set #ritual.inputs diab.tmp 0

execute if score #ritual.inputs diab.tmp matches 1 run function diabolical:rituals/start/first_signature
execute unless score #ritual.inputs diab.tmp matches 1 run function diabolical:rituals/fail/first_signature
