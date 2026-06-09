# Adds the #amount diab.tmp value to the executing player's debt.
scoreboard players operation @s diab.debt += #amount diab.tmp

execute if score @s diab.debt matches 1..9 run tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"A small debt is entered beside your name.","color":"gray"}]
execute if score @s diab.debt matches 10..49 run tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Your debt is now active.","color":"yellow"}]
execute if score @s diab.debt matches 50..99 run tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Your debt is severe.","color":"gold"}]
execute if score @s diab.debt matches 100.. run tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Collectors will remember this balance.","color":"red"}]
function diabolical:feedback/add_debt

scoreboard players reset #amount diab.tmp
