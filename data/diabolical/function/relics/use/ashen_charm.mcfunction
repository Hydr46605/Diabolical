# Uses Ashen Charm if selected.
execute unless entity @s[nbt={SelectedItem:{id:"minecraft:fire_charge",components:{"minecraft:custom_data":{diabolical:{relic:"ashen_charm"}}}}}] run function diabolical:relics/use/fail_missing
execute if entity @s[nbt={SelectedItem:{id:"minecraft:fire_charge",components:{"minecraft:custom_data":{diabolical:{relic:"ashen_charm"}}}}}] if score @s diab.cooldown matches 1.. run function diabolical:relics/use/fail_cooldown
execute if entity @s[nbt={SelectedItem:{id:"minecraft:fire_charge",components:{"minecraft:custom_data":{diabolical:{relic:"ashen_charm"}}}}}] if score @s diab.cooldown matches 0 run function diabolical:relics/use/apply/ashen_charm
