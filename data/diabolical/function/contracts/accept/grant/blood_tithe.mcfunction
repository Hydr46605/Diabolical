# Grants Blood Tithe.
tag @s add diab.contract_active
tag @s add diab.contract.blood_tithe
scoreboard players set @s diab.contract 7
scoreboard players set @s diab.cdebt 18
scoreboard players operation @s diab.btithe = @s diab.kzombie
scoreboard players operation @s diab.btithe += @s diab.kills
scoreboard players operation @s diab.btithe += @s diab.kwither
advancement grant @s only diabolical:contracts/unlocked
advancement grant @s only diabolical:contracts/blood_tithe

scoreboard players set #amount diab.tmp 4
function diabolical:core/add_sin
scoreboard players set #amount diab.tmp 18
function diabolical:core/add_debt

effect give @s minecraft:strength 20 0 true
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Signed: Blood Tithe. Hostile kills can pay the contract, but every credited kill adds sin.","color":"gray"}]
function diabolical:feedback/contract_signed
