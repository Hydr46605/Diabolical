# Breaks an Accusers Seal for major sin and debt recovery.
clear @s minecraft:netherite_scrap[minecraft:custom_data={diabolical:{court_item:"accusers_seal"}}] 1
scoreboard players set #amount diab.tmp 15
function diabolical:core/pay_sin
scoreboard players set #amount diab.tmp 5
function diabolical:core/pay_debt
scoreboard players set @s diab.cooldown 120
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"The seal breaks. One lost case is credited to your account.","color":"gray"}]
