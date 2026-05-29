# Awakens a selected Hellbound Compass if the player has the required materials.
scoreboard players set #awaken.ready diab.tmp 1
scoreboard players set #awaken.echo diab.tmp 0
scoreboard players set #awaken.amethyst diab.tmp 0
scoreboard players set #awaken.redstone diab.tmp 0

execute unless entity @s[nbt={SelectedItem:{id:"minecraft:recovery_compass",components:{"minecraft:custom_data":{diabolical:{relic:"hellbound_compass"}}}}}] run scoreboard players set #awaken.ready diab.tmp 0
execute if score @s diab.cooldown matches 1.. run scoreboard players set #awaken.ready diab.tmp 0
execute store result score #awaken.echo diab.tmp run clear @s minecraft:echo_shard 0
execute store result score #awaken.amethyst diab.tmp run clear @s minecraft:amethyst_shard 0
execute store result score #awaken.redstone diab.tmp run clear @s minecraft:redstone 0
execute unless score #awaken.echo diab.tmp matches 1.. run scoreboard players set #awaken.ready diab.tmp 0
execute unless score #awaken.amethyst diab.tmp matches 3.. run scoreboard players set #awaken.ready diab.tmp 0
execute unless score #awaken.redstone diab.tmp matches 4.. run scoreboard players set #awaken.ready diab.tmp 0

execute if score #awaken.ready diab.tmp matches 1 run function diabolical:relics/awaken/apply/hellbound_compass
execute unless score #awaken.ready diab.tmp matches 1 run function diabolical:relics/awaken/fail_hellbound_compass

scoreboard players reset #awaken.ready diab.tmp
scoreboard players reset #awaken.echo diab.tmp
scoreboard players reset #awaken.amethyst diab.tmp
scoreboard players reset #awaken.redstone diab.tmp
