# Locks exact Bell of Remission offerings before applying the result.
tag @s add diab.altar_item
tag @e[type=item,distance=..1.25,nbt={Item:{id:"minecraft:amethyst_shard",count:1}},limit=1,sort=nearest] add diab.altar_item
tag @e[type=item,distance=..1.25,nbt={Item:{id:"minecraft:emerald",count:1}},limit=1,sort=nearest] add diab.altar_item

function diabolical:rituals/success/bell_of_remission
