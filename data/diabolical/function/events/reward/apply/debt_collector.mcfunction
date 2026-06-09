# Pays debt for defeating a Debt Collector.
execute store result score #amount diab.tmp run data get storage diabolical:events debt_collector.reward_debt_payment
function diabolical:core/pay_debt
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"The collector's claim is credited against your balance.","color":"gray"}]
function diabolical:feedback/event_reward
