# The Accuser pressure: capstone court hunter for extreme sin.
effect give @s minecraft:strength 2 1 true
effect give @s minecraft:resistance 2 1 true
effect give @s minecraft:fire_resistance 2 0 true
effect give @s minecraft:glowing 2 0 true
execute as @a[tag=diab.court_target,distance=..24] run effect give @s minecraft:darkness 3 0 true
execute as @a[tag=diab.court_target,distance=..12] run effect give @s minecraft:weakness 3 0 true
execute at @s run particle minecraft:soul_fire_flame ~ ~1.1 ~ 0.55 0.6 0.55 0.02 8 force @a[distance=..28]
execute at @s run particle minecraft:ash ~ ~1.1 ~ 0.7 0.7 0.7 0.02 8 force @a[distance=..28]
