# Reveals the current debt state at a small cost.
advancement grant @s only diabolical:relics/first_relic
advancement grant @s only diabolical:relics/hellbound_compass
function diabolical:advancements/check/starter_relics
effect give @s minecraft:glowing 15 0 true
scoreboard players set @s diab.cooldown 100
scoreboard players set #amount diab.tmp 1
function diabolical:core/add_sin
scoreboard players set #amount diab.tmp 1
function diabolical:core/add_debt
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Debt: ","color":"gray"},{"score":{"name":"@s","objective":"diab.debt"},"color":"white"},{"text":"  Contract debt: ","color":"gray"},{"score":{"name":"@s","objective":"diab.cdebt"},"color":"white"}]
