# Grants Ashen Credit.
tag @s add diab.contract_active
tag @s add diab.contract.ashen_credit
scoreboard players set @s diab.contract 8
scoreboard players set @s diab.cdebt 24
advancement grant @s only diabolical:contracts/unlocked
advancement grant @s only diabolical:contracts/ashen_credit

scoreboard players remove @s diab.debt 10
execute if score @s diab.debt matches ..-1 run scoreboard players set @s diab.debt 0
scoreboard players remove @s diab.sin 3
execute if score @s diab.sin matches ..-1 run scoreboard players set @s diab.sin 0

scoreboard players set #amount diab.tmp 2
function diabolical:core/add_sin
scoreboard players set #amount diab.tmp 24
function diabolical:core/add_debt

effect give @s minecraft:resistance 20 0 true
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Signed: Ashen Credit. Some old pressure clears, but the new number is larger.","color":"gray"}]
function diabolical:feedback/contract_signed
