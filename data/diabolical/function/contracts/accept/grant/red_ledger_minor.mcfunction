# Grants Red Ledger Minor.
tag @s add diab.contract_active
tag @s add diab.contract.red_ledger_minor
scoreboard players set @s diab.contract 3
scoreboard players set @s diab.cdebt 12
advancement grant @s only diabolical:contracts/unlocked
advancement grant @s only diabolical:contracts/red_ledger_minor
function diabolical:advancements/check/starter_contracts
function diabolical:advancements/check/minor_contracts

scoreboard players set #amount diab.tmp 2
function diabolical:core/add_sin
scoreboard players set #amount diab.tmp 12
function diabolical:core/add_debt

give @s minecraft:emerald 3
function diabolical:relics/give/midas_coin
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Signed: Red Ledger Minor. The ledger pays in emeralds and a Midas Coin. Right-click the Infernal Ledger to pay or revoke.","color":"gray"}]
function diabolical:feedback/contract_signed
function diabolical:events/start/diabolical_night
