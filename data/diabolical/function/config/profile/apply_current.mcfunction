# Reapplies the stored balance profile after module bootstrap.
scoreboard players add #profile diab.config 0
execute if data storage diabolical:config profile_id store result score #profile diab.config run data get storage diabolical:config profile_id
execute unless score #profile diab.config matches 0..2 run scoreboard players set #profile diab.config 1
execute if score #profile diab.config matches 0 run function diabolical:config/profile/apply/calm
execute if score #profile diab.config matches 1 run function diabolical:config/profile/apply/default
execute if score #profile diab.config matches 2 run function diabolical:config/profile/apply/hard
