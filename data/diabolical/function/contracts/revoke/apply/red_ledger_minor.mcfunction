# Applies Red Ledger Minor cleanup.
tag @s remove diab.contract_active
tag @s remove diab.contract.red_ledger_minor
scoreboard players set @s diab.contract 0
scoreboard players set @s diab.cdebt 0
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Red Ledger Minor is closed.","color":"gray"}]
