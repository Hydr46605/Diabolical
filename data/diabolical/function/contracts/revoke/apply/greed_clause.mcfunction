# Applies Greed Clause cleanup.
tag @s remove diab.contract_active
tag @s remove diab.contract.greed_clause
scoreboard players set @s diab.contract 0
scoreboard players set @s diab.cdebt 0
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Greed Clause is closed.","color":"gray"}]
