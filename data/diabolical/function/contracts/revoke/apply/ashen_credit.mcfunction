# Closes Ashen Credit.
tag @s remove diab.contract_active
tag @s remove diab.contract.ashen_credit
scoreboard players set @s diab.contract 0
scoreboard players set @s diab.cdebt 0
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Ashen Credit is closed.","color":"gray"}]
