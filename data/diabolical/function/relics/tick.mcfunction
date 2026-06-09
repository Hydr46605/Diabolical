# Lightweight selected-relic detection.
tag @a remove diab.relic_holder

execute as @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{diabolical:{relic:"ashen_charm"}}}}}] at @s run function diabolical:relics/tick/ashen_charm
execute as @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{diabolical:{relic:"midas_coin"}}}}}] at @s run function diabolical:relics/tick/midas_coin
execute as @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{diabolical:{relic:"hellbound_compass"}}}}}] at @s run function diabolical:relics/tick/hellbound_compass
execute as @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{diabolical:{relic:"awakened_hellbound_compass"}}}}}] at @s run function diabolical:relics/tick/awakened_hellbound_compass
