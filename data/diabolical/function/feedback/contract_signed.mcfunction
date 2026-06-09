# Stronger feedback for a newly signed contract.
execute at @s run playsound minecraft:block.enchantment_table.use master @s ~ ~ ~ 0.65 0.7
execute at @s run playsound minecraft:item.book.page_turn master @s ~ ~ ~ 0.6 0.65
execute at @s run particle minecraft:soul_fire_flame ~ ~1 ~ 0.55 0.35 0.55 0.03 18 force @s
execute at @s run particle minecraft:ash ~ ~1 ~ 0.65 0.4 0.65 0.02 22 force @s
