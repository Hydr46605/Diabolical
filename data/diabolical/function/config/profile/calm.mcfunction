# Applies a calmer server profile with later pressure and longer cooldowns.
function diabolical:config/profile/apply/calm
execute if entity @s run tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Balance profile set to calm.","color":"gray"}]
