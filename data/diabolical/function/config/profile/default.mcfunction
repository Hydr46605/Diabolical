# Applies the standard Diabolical balance profile.
function diabolical:config/profile/apply/default
execute if entity @s run tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Balance profile set to default.","color":"gray"}]
