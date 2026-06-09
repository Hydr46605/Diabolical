# Credits one Blood Tithe kill.
scoreboard players add @s diab.btithe 1
scoreboard players set #amount diab.tmp 3
function diabolical:core/pay_debt
scoreboard players set #amount diab.tmp 1
function diabolical:core/add_sin
effect give @s minecraft:strength 5 0 true
execute if score @s diab.cdebt matches 1.. run tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Blood Tithe credited a kill. Contract debt: ","color":"gray"},{"score":{"name":"@s","objective":"diab.cdebt"},"color":"white"}]
