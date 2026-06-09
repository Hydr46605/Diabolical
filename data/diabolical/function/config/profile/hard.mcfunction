# Applies a harder server profile with earlier pressure and shorter cooldowns.
function diabolical:config/profile/apply/hard
execute if entity @s run tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Balance profile set to hard.","color":"gray"}]
