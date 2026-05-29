# Uses Ashen Brief as a crafted sin-recovery item.
execute unless entity @s[nbt={SelectedItem:{id:"minecraft:book",components:{"minecraft:custom_data":{diabolical:{court_item:"ashen_brief"}}}}}] run function diabolical:mobs/use/fail_missing
execute if entity @s[nbt={SelectedItem:{id:"minecraft:book",components:{"minecraft:custom_data":{diabolical:{court_item:"ashen_brief"}}}}}] run function diabolical:mobs/use/apply_ashen_brief
