# Uses Black Writ to call The Accuser.
execute unless entity @s[nbt={SelectedItem:{id:"minecraft:paper",components:{"minecraft:custom_data":{diabolical:{court_item:"black_writ"}}}}}] run function diabolical:mobs/use/fail_missing
execute if entity @s[nbt={SelectedItem:{id:"minecraft:paper",components:{"minecraft:custom_data":{diabolical:{court_item:"black_writ"}}}}}] if score #court.active diab.mob matches 1 run function diabolical:mobs/use/fail_active
execute if entity @s[nbt={SelectedItem:{id:"minecraft:paper",components:{"minecraft:custom_data":{diabolical:{court_item:"black_writ"}}}}}] if score #court.active diab.mob matches 0 run function diabolical:mobs/use/apply_black_writ
