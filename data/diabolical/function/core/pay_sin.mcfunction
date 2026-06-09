# Pays the #amount diab.tmp value from the executing player's sin.
scoreboard players operation @s diab.sin -= #amount diab.tmp
execute if score @s diab.sin matches ..-1 run scoreboard players set @s diab.sin 0

tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Sin cleansed. Remaining sin: ","color":"gray"},{"score":{"name":"@s","objective":"diab.sin"},"color":"white"}]
function diabolical:feedback/pay_sin

scoreboard players reset #amount diab.tmp
