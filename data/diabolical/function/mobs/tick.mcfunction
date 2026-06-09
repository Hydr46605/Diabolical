# Routes Sinbound Court natural pressure and active encounters.
execute if score #court.imp_cd diab.mob matches 1.. run scoreboard players remove #court.imp_cd diab.mob 1
execute if score #court.wraith_cd diab.mob matches 1.. run scoreboard players remove #court.wraith_cd diab.mob 1
execute if score #court.bailiff_cd diab.mob matches 1.. run scoreboard players remove #court.bailiff_cd diab.mob 1
execute if score #court.advocate_cd diab.mob matches 1.. run scoreboard players remove #court.advocate_cd diab.mob 1
execute if score #court.accuser_cd diab.mob matches 1.. run scoreboard players remove #court.accuser_cd diab.mob 1

execute if score #court.active diab.mob matches 1 run scoreboard players remove #court.timer diab.mob 1
execute if score #court.active diab.mob matches 1 as @e[tag=diab.mob.contract_imp] at @s run function diabolical:mobs/tick/contract_imp
execute if score #court.active diab.mob matches 1 as @e[tag=diab.mob.sin_wraith] at @s run function diabolical:mobs/tick/sin_wraith
execute if score #court.active diab.mob matches 1 as @e[tag=diab.mob.ledger_bailiff] at @s run function diabolical:mobs/tick/ledger_bailiff
execute if score #court.active diab.mob matches 1 as @e[tag=diab.mob.ashen_advocate] at @s run function diabolical:mobs/tick/ashen_advocate
execute if score #court.active diab.mob matches 1 as @e[tag=diab.mob.the_accuser] at @s run function diabolical:mobs/tick/the_accuser

execute if score #court.active diab.mob matches 1 if score #court.kind diab.mob matches 1 as @a[tag=diab.court_target,limit=1] if score @s diab.kzombie > #court.kills diab.mob run function diabolical:mobs/reward/contract_imp
execute if score #court.active diab.mob matches 1 if score #court.kind diab.mob matches 2 as @a[tag=diab.court_target,limit=1] if score @s diab.kphantom > #court.kills diab.mob run function diabolical:mobs/reward/sin_wraith
execute if score #court.active diab.mob matches 1 if score #court.kind diab.mob matches 3 as @a[tag=diab.court_target,limit=1] if score @s diab.kills > #court.kills diab.mob run function diabolical:mobs/reward/ledger_bailiff
execute if score #court.active diab.mob matches 1 if score #court.kind diab.mob matches 4 as @a[tag=diab.court_target,limit=1] if score @s diab.kwitch > #court.kills diab.mob run function diabolical:mobs/reward/ashen_advocate
execute if score #court.active diab.mob matches 1 if score #court.kind diab.mob matches 5 as @a[tag=diab.court_target,limit=1] if score @s diab.kwither > #court.kills diab.mob run function diabolical:mobs/reward/the_accuser

execute if score #court.active diab.mob matches 1 unless entity @a[tag=diab.court_target] run function diabolical:mobs/stop/active
execute if score #court.active diab.mob matches 1 unless entity @e[tag=diab.court_mob] run function diabolical:mobs/stop/active
execute if score #court.active diab.mob matches 1 if score #court.timer diab.mob matches ..0 run function diabolical:mobs/stop/active

execute unless score #court.active diab.mob matches 1 unless score #court.accuser_cd diab.mob matches 1.. as @a[sort=random] if score @s diab.sin >= #court.accuser_sin diab.mob unless score #court.active diab.mob matches 1 run function diabolical:mobs/summon/the_accuser
execute unless score #court.active diab.mob matches 1 unless score #court.bailiff_cd diab.mob matches 1.. as @a[sort=random] if score @s diab.debt >= #court.bailiff_debt diab.mob if score @s diab.sin >= #court.bailiff_sin diab.mob unless score #court.active diab.mob matches 1 run function diabolical:mobs/summon/ledger_bailiff
execute unless score #court.active diab.mob matches 1 unless score #court.wraith_cd diab.mob matches 1.. as @a[sort=random] if score @s diab.sin >= #court.wraith_sin diab.mob unless score #court.active diab.mob matches 1 run function diabolical:mobs/summon/sin_wraith
execute unless score #court.active diab.mob matches 1 unless score #court.imp_cd diab.mob matches 1.. as @a[sort=random] if score @s diab.sin >= #court.imp_sin diab.mob unless score #court.active diab.mob matches 1 run function diabolical:mobs/summon/contract_imp
