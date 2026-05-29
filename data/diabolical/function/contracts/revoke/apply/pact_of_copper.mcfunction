# Applies Pact of Copper cleanup.
tag @s remove diab.contract_active
tag @s remove diab.contract.pact_of_copper
scoreboard players set @s diab.contract 0
scoreboard players set @s diab.cdebt 0
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Pact of Copper is closed.","color":"gray"}]
