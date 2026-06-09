# Sin Wraith pressure: hunts from above and stains the target's vision.
effect give @s minecraft:speed 2 1 true
effect give @s minecraft:glowing 2 0 true
execute as @a[tag=diab.court_target,distance=..20] run effect give @s minecraft:darkness 3 0 true
execute at @s run particle minecraft:soul_fire_flame ~ ~0.6 ~ 0.4 0.4 0.4 0.02 5 force @a[distance=..24]
