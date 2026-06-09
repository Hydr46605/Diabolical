# Uses Court Candle to call an Ashen Advocate.
execute unless entity @s[nbt={SelectedItem:{id:"minecraft:red_candle",components:{"minecraft:custom_data":{diabolical:{court_item:"court_candle"}}}}}] run function diabolical:mobs/use/fail_missing
execute if entity @s[nbt={SelectedItem:{id:"minecraft:red_candle",components:{"minecraft:custom_data":{diabolical:{court_item:"court_candle"}}}}}] if score #court.active diab.mob matches 1 run function diabolical:mobs/use/fail_active
execute if entity @s[nbt={SelectedItem:{id:"minecraft:red_candle",components:{"minecraft:custom_data":{diabolical:{court_item:"court_candle"}}}}}] if score #court.active diab.mob matches 0 run function diabolical:mobs/use/apply_court_candle
