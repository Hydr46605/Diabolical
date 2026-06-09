# Files an Ashen Brief and cleanses a measured amount of sin.
clear @s minecraft:book[minecraft:custom_data={diabolical:{court_item:"ashen_brief"}}] 1
function diabolical:feedback/court_item_used
scoreboard players set #amount diab.tmp 8
function diabolical:core/pay_sin
scoreboard players set @s diab.cooldown 80
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"The Ashen Brief is filed as remission evidence.","color":"gray"}]
function diabolical:feedback/court_reward
