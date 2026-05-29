# Applies Ashen Charm's one-use protection.
advancement grant @s only diabolical:relics/first_relic
advancement grant @s only diabolical:relics/ashen_charm
function diabolical:advancements/check/starter_relics
effect give @s minecraft:fire_resistance 60 0 true
effect give @s minecraft:resistance 8 0 true
scoreboard players set @s diab.cooldown 200
scoreboard players set #amount diab.tmp 5
function diabolical:core/add_debt
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"The Ashen Charm burns away and leaves debt behind.","color":"gray"}]
function diabolical:feedback/relic_used
function diabolical:relics/break/ashen_charm
