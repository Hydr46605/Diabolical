# Uses Midas Coin if selected.
execute unless entity @s[nbt={SelectedItem:{id:"minecraft:gold_nugget",components:{"minecraft:custom_data":{diabolical:{relic:"midas_coin"}}}}}] run function diabolical:relics/use/fail_missing
execute if entity @s[nbt={SelectedItem:{id:"minecraft:gold_nugget",components:{"minecraft:custom_data":{diabolical:{relic:"midas_coin"}}}}}] if score @s diab.cooldown matches 1.. run function diabolical:relics/use/fail_cooldown
execute if entity @s[nbt={SelectedItem:{id:"minecraft:gold_nugget",components:{"minecraft:custom_data":{diabolical:{relic:"midas_coin"}}}}}] if score @s diab.cooldown matches 0 run function diabolical:relics/use/apply/midas_coin
