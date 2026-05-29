# Resets all online players.
execute as @a run function diabolical:core/reset_player
tellraw @a [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Online player state was reset.","color":"gray"}]
