# Locks exact First Signature offerings before applying the result.
tag @s add diab.altar_item
tag @e[type=item,distance=..1.25,nbt={Item:{id:"minecraft:ink_sac",count:1}},limit=1,sort=nearest] add diab.altar_item
tag @e[type=item,distance=..1.25,nbt={Item:{id:"minecraft:gold_nugget",count:1}},limit=1,sort=nearest] add diab.altar_item

function diabolical:rituals/success/first_signature
