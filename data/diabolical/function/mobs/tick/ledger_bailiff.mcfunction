# Ledger Bailiff pressure: durable collector variant for mixed debt and sin.
effect give @s minecraft:strength 2 0 true
effect give @s minecraft:resistance 2 0 true
effect give @s minecraft:glowing 2 0 true
execute as @a[tag=diab.court_target,distance=..18] run effect give @s minecraft:glowing 2 0 true
execute at @s run particle minecraft:ash ~ ~1 ~ 0.35 0.4 0.35 0.01 5 force @a[distance=..20]
