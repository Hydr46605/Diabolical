# Applies Pact of Hunger cleanup.
tag @s remove diab.contract_active
tag @s remove diab.contract.pact_of_hunger
scoreboard players set @s diab.contract 0
scoreboard players set @s diab.cdebt 0
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Pact of Hunger is closed.","color":"gray"}]
