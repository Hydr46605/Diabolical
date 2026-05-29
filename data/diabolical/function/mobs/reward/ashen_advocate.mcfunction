# Rewards the court target for defeating an Ashen Advocate.
advancement grant @s only diabolical:mobs/ashen_advocate
execute store result score #amount diab.tmp run data get storage diabolical:mobs rewards.advocate_sin_payment
function diabolical:core/pay_sin
give @s minecraft:glow_ink_sac 2
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"The advocate's ash becomes usable evidence.","color":"gray"}]
function diabolical:mobs/stop/active
