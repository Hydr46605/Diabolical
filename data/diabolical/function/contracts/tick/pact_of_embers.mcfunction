# Pact of Embers: fire protection, water weakness.
effect give @s minecraft:fire_resistance 3 0 true
execute if block ~ ~ ~ minecraft:water run effect give @s minecraft:weakness 3 0 true
execute if block ~ ~1 ~ minecraft:water run effect give @s minecraft:weakness 3 0 true
