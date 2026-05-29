# Uses Bailiff Bell to call a Ledger Bailiff.
execute unless entity @s[nbt={SelectedItem:{id:"minecraft:bell",components:{"minecraft:custom_data":{diabolical:{court_item:"bailiff_bell"}}}}}] run function diabolical:mobs/use/fail_missing
execute if entity @s[nbt={SelectedItem:{id:"minecraft:bell",components:{"minecraft:custom_data":{diabolical:{court_item:"bailiff_bell"}}}}}] if score #court.active diab.mob matches 1 run function diabolical:mobs/use/fail_active
execute if entity @s[nbt={SelectedItem:{id:"minecraft:bell",components:{"minecraft:custom_data":{diabolical:{court_item:"bailiff_bell"}}}}}] if score #court.active diab.mob matches 0 run function diabolical:mobs/use/apply_bailiff_bell
