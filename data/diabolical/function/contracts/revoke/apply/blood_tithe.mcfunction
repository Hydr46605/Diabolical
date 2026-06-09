# Closes Blood Tithe.
tag @s remove diab.contract_active
tag @s remove diab.contract.blood_tithe
scoreboard players set @s diab.contract 0
scoreboard players set @s diab.cdebt 0
scoreboard players set @s diab.btithe 0
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Blood Tithe is closed.","color":"gray"}]
