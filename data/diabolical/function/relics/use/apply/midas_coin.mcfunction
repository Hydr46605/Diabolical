# Converts a little debt into gold.
advancement grant @s only diabolical:relics/first_relic
advancement grant @s only diabolical:relics/midas_coin
function diabolical:advancements/check/starter_relics
give @s minecraft:gold_nugget 3
scoreboard players set @s diab.cooldown 200
scoreboard players set #amount diab.tmp 1
function diabolical:core/add_sin
scoreboard players set #amount diab.tmp 2
function diabolical:core/add_debt
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"The coin answers greed with interest.","color":"gray"}]
