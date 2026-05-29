# Contract Imp pressure: fast, visible, and irritating.
effect give @s minecraft:speed 2 0 true
effect give @s minecraft:glowing 2 0 true
execute at @s run particle minecraft:ash ~ ~0.8 ~ 0.25 0.3 0.25 0.01 3 force @a[distance=..16]
