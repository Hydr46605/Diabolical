# Applies a Pact of Hunger payment.
scoreboard players set #amount diab.tmp 3
function diabolical:core/pay_debt
execute if score @s diab.cdebt matches 1.. run tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Contract debt remaining: ","color":"gray"},{"score":{"name":"@s","objective":"diab.cdebt"},"color":"white"}]
