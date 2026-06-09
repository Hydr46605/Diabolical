# Applies Pact of Embers cleanup.
tag @s remove diab.contract_active
tag @s remove diab.contract.pact_of_embers
scoreboard players set @s diab.contract 0
scoreboard players set @s diab.cdebt 0
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Pact of Embers is closed.","color":"gray"}]
