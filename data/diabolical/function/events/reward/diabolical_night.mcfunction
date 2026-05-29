# Pays a small amount of debt for surviving Diabolical Night.
advancement grant @s only diabolical:events/survive_diabolical_night
advancement grant @s only diabolical:mastery/night_survivor
execute store result score #amount diab.tmp run data get storage diabolical:events diabolical_night.reward_debt_payment
function diabolical:core/pay_debt
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Survival is credited against your balance.","color":"gray"}]
function diabolical:feedback/event_reward
