# Subtle feedback for gaining sin.
execute at @s run playsound minecraft:block.sculk_sensor.clicking master @s ~ ~ ~ 0.35 0.7
execute at @s run particle minecraft:ash ~ ~1 ~ 0.35 0.25 0.35 0.01 8 force @s
execute at @s run particle minecraft:soul_fire_flame ~ ~1 ~ 0.22 0.18 0.22 0.01 5 force @s
