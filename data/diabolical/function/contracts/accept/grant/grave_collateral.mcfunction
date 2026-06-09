# Grants Grave Collateral.
tag @s add diab.contract_active
tag @s add diab.contract.grave_collateral
scoreboard players set @s diab.contract 9
scoreboard players set @s diab.cdebt 32
scoreboard players set @s diab.gravecd 0
advancement grant @s only diabolical:contracts/unlocked
advancement grant @s only diabolical:contracts/grave_collateral

scoreboard players set #amount diab.tmp 6
function diabolical:core/add_sin
scoreboard players set #amount diab.tmp 32
function diabolical:core/add_debt

effect give @s minecraft:absorption 20 0 true
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Signed: Grave Collateral. The Ledger may keep you alive, but every save adds to the account.","color":"gray"}]
function diabolical:feedback/contract_signed
