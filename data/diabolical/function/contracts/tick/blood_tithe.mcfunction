# Blood Tithe: selected hostile kills reduce contract debt and add sin.
scoreboard players set #blood.total diab.tmp 0
scoreboard players operation #blood.total diab.tmp += @s diab.kzombie
scoreboard players operation #blood.total diab.tmp += @s diab.kills
scoreboard players operation #blood.total diab.tmp += @s diab.kwither
execute if score #blood.total diab.tmp > @s diab.btithe run function diabolical:contracts/tick/apply_blood_tithe_kill
