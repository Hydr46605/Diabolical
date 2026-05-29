# Rewards the court target for defeating a Ledger Bailiff.
advancement grant @s only diabolical:mobs/ledger_bailiff
execute store result score #amount diab.tmp run data get storage diabolical:mobs rewards.bailiff_debt_payment
function diabolical:core/pay_debt
execute store result score #amount diab.tmp run data get storage diabolical:mobs rewards.bailiff_sin_payment
function diabolical:core/pay_sin
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"The bailiff's notice is overturned.","color":"gray"}]
function diabolical:mobs/stop/active
