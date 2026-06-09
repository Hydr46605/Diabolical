# Uses Accusers Seal as rare court recovery.
execute unless entity @s[nbt={SelectedItem:{id:"minecraft:netherite_scrap",components:{"minecraft:custom_data":{diabolical:{court_item:"accusers_seal"}}}}}] run function diabolical:mobs/use/fail_missing
execute if entity @s[nbt={SelectedItem:{id:"minecraft:netherite_scrap",components:{"minecraft:custom_data":{diabolical:{court_item:"accusers_seal"}}}}}] run function diabolical:mobs/use/apply_accusers_seal
