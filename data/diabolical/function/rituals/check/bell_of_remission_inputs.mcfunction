# Validates exact Bell of Remission offerings near the altar.
scoreboard players set #ritual.inputs diab.tmp 1
scoreboard players set #ritual.owner_debt diab.tmp 0
scoreboard players set #ritual.owner_sin diab.tmp 0

execute unless entity @s[nbt={Item:{id:"minecraft:bell",count:1}}] run scoreboard players set #ritual.inputs diab.tmp 0
execute unless entity @e[type=item,distance=..1.25,nbt={Item:{id:"minecraft:amethyst_shard",count:1}},limit=1] run scoreboard players set #ritual.inputs diab.tmp 0
execute unless entity @e[type=item,distance=..1.25,nbt={Item:{id:"minecraft:emerald",count:1}},limit=1] run scoreboard players set #ritual.inputs diab.tmp 0
execute as @a[distance=..8,limit=1,sort=nearest] if score @s diab.debt matches 1.. run scoreboard players set #ritual.owner_debt diab.tmp 1
execute as @a[distance=..8,limit=1,sort=nearest] if score @s diab.sin matches 1.. run scoreboard players set #ritual.owner_sin diab.tmp 1
execute unless score #ritual.owner_debt diab.tmp matches 1 unless score #ritual.owner_sin diab.tmp matches 1 run scoreboard players set #ritual.inputs diab.tmp 0

execute if score #ritual.inputs diab.tmp matches 1 run function diabolical:rituals/start/bell_of_remission
execute unless score #ritual.inputs diab.tmp matches 1 run function diabolical:rituals/fail/bell_of_remission
