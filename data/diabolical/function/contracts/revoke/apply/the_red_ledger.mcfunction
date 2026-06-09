# Applies The Red Ledger cleanup.
tag @s remove diab.contract_active
tag @s remove diab.contract.the_red_ledger
scoreboard players set @s diab.contract 0
scoreboard players set @s diab.cdebt 0
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"The Red Ledger is closed.","color":"gray"}]
