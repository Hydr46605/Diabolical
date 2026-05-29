# Uses Sinners Effigy to bait a Sin Wraith.
execute unless entity @s[nbt={SelectedItem:{id:"minecraft:armor_stand",components:{"minecraft:custom_data":{diabolical:{court_item:"sinners_effigy"}}}}}] run function diabolical:mobs/use/fail_missing
execute if entity @s[nbt={SelectedItem:{id:"minecraft:armor_stand",components:{"minecraft:custom_data":{diabolical:{court_item:"sinners_effigy"}}}}}] if score #court.active diab.mob matches 1 run function diabolical:mobs/use/fail_active
execute if entity @s[nbt={SelectedItem:{id:"minecraft:armor_stand",components:{"minecraft:custom_data":{diabolical:{court_item:"sinners_effigy"}}}}}] if score #court.active diab.mob matches 0 run function diabolical:mobs/use/apply_sinners_effigy
