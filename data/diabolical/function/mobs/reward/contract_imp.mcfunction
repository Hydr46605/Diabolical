# Rewards the court target for defeating a Contract Imp.
advancement grant @s only diabolical:mobs/contract_imp
execute store result score #amount diab.tmp run data get storage diabolical:mobs rewards.imp_debt_payment
function diabolical:core/pay_debt
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"The imp's complaint is dismissed and credited against your balance.","color":"gray"}]
function diabolical:feedback/court_reward
function diabolical:mobs/stop/active
