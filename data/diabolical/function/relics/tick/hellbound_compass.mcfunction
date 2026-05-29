# Hellbound Compass marks indebted selected holders.
tag @s add diab.relic_holder
execute if score @s diab.debt matches 1.. run effect give @s minecraft:glowing 2 0 true
