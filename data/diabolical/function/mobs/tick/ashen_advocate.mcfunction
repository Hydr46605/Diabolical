# Ashen Advocate pressure: protects court mobs and weakens the target.
effect give @s minecraft:resistance 2 0 true
effect give @s minecraft:fire_resistance 2 0 true
effect give @s minecraft:glowing 2 0 true
execute as @a[tag=diab.court_target,distance=..16] run effect give @s minecraft:weakness 3 0 true
execute at @s run particle minecraft:witch ~ ~1 ~ 0.35 0.4 0.35 0.02 6 force @a[distance=..20]
