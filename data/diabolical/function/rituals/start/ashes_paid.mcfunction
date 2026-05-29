# Locks exact Ashes Paid offerings before applying the result.
tag @s add diab.altar_item
tag @e[type=item,distance=..1.25,nbt={Item:{id:"minecraft:lapis_lazuli",count:1}},limit=1,sort=nearest] add diab.altar_item
tag @e[type=item,distance=..1.25,nbt={Item:{id:"minecraft:water_bucket",count:1}},limit=1,sort=nearest] add diab.altar_item

function diabolical:rituals/success/ashes_paid
