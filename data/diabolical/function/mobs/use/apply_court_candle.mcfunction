# Applies Court Candle and starts an Ashen Advocate trial.
clear @s minecraft:red_candle[minecraft:custom_data={diabolical:{court_item:"court_candle"}}] 1
function diabolical:feedback/court_item_used
function diabolical:mobs/summon/ashen_advocate
