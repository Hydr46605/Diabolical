# Resets the executing player.
function diabolical:core/reset_player
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Your Diabolical state was reset.","color":"gray"}]
