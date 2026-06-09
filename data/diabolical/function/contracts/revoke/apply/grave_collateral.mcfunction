# Closes Grave Collateral.
tag @s remove diab.contract_active
tag @s remove diab.contract.grave_collateral
scoreboard players set @s diab.contract 0
scoreboard players set @s diab.cdebt 0
scoreboard players set @s diab.gravecd 0
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Grave Collateral is closed.","color":"gray"}]
