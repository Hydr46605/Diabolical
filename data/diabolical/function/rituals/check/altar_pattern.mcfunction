# Validates the Infernal Altar pattern beneath the trigger item.
scoreboard players set #ritual.altar diab.tmp 1
execute unless block ~ ~-1 ~ minecraft:crying_obsidian run scoreboard players set #ritual.altar diab.tmp 0
execute unless block ~1 ~-1 ~ #diabolical:altar_soul_blocks run scoreboard players set #ritual.altar diab.tmp 0
execute unless block ~-1 ~-1 ~ #diabolical:altar_soul_blocks run scoreboard players set #ritual.altar diab.tmp 0
execute unless block ~ ~-1 ~1 #diabolical:altar_soul_blocks run scoreboard players set #ritual.altar diab.tmp 0
execute unless block ~ ~-1 ~-1 #diabolical:altar_soul_blocks run scoreboard players set #ritual.altar diab.tmp 0

execute if score #ritual.altar diab.tmp matches 1 run function diabolical:rituals/check/inputs
execute unless score #ritual.altar diab.tmp matches 1 run function diabolical:rituals/check/fail_current
