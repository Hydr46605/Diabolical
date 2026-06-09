# Rewards the court target for defeating a Sin Wraith.
advancement grant @s only diabolical:mobs/sin_wraith
execute store result score #amount diab.tmp run data get storage diabolical:mobs rewards.wraith_sin_payment
function diabolical:core/pay_sin
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"The wraith breaks apart and takes a stain with it.","color":"gray"}]
function diabolical:feedback/court_reward
function diabolical:mobs/stop/active
