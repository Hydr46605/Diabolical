# Adds the #amount diab.tmp value to the executing player's sin.
scoreboard players operation @s diab.sin += #amount diab.tmp

execute if score @s diab.sin matches 1..24 run tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"You are marked.","color":"gray"}]
execute if score @s diab.sin matches 25..74 run tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Your name darkens in the ledger.","color":"gray"}]
execute if score @s diab.sin matches 75..149 run tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"The ledger condemns you.","color":"gray"}]
execute if score @s diab.sin matches 150.. run tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"The infernal account knows you well.","color":"gray"}]
function diabolical:feedback/add_sin

scoreboard players reset #amount diab.tmp
