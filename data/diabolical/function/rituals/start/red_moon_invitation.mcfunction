# Locks exact Red Moon Invitation offerings before applying the result.
tag @s add diab.altar_item
tag @e[type=item,distance=..1.25,nbt={Item:{id:"minecraft:rotten_flesh",count:1}},limit=1,sort=nearest] add diab.altar_item
tag @e[type=item,distance=..1.25,nbt={Item:{id:"minecraft:redstone",count:1}},limit=1,sort=nearest] add diab.altar_item

function diabolical:rituals/success/red_moon_invitation
