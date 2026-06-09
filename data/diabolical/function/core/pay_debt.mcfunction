# Pays the #amount diab.tmp value from the executing player's debt.
scoreboard players operation @s diab.debt -= #amount diab.tmp
execute if score @s diab.debt matches ..-1 run scoreboard players set @s diab.debt 0
execute if score @s diab.cdebt matches 1.. run scoreboard players operation @s diab.cdebt -= #amount diab.tmp
execute if score @s diab.cdebt matches ..-1 run scoreboard players set @s diab.cdebt 0
execute if score @s diab.cdebt matches 0 if entity @s[tag=diab.contract_active] run function diabolical:contracts/close_paid_active

tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Debt paid. Remaining debt: ","color":"gray"},{"score":{"name":"@s","objective":"diab.debt"},"color":"white"}]
function diabolical:feedback/pay_debt

scoreboard players reset #amount diab.tmp
