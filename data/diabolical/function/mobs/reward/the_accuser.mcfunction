# Rewards the court target for defeating The Accuser.
advancement grant @s only diabolical:mobs/the_accuser
advancement grant @s only diabolical:mastery/sinbound_court
execute store result score #amount diab.tmp run data get storage diabolical:mobs rewards.accuser_sin_payment
function diabolical:core/pay_sin
execute store result score #amount diab.tmp run data get storage diabolical:mobs rewards.accuser_debt_payment
function diabolical:core/pay_debt
function diabolical:mobs/give/accusers_seal
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"The Accuser falls silent. The court leaves a seal behind.","color":"gray"}]
function diabolical:feedback/court_reward
function diabolical:mobs/stop/active
