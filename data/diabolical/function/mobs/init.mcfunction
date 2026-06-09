# Sinbound Court module bootstrap.
data merge storage diabolical:mobs {version:"0.5.0-dev",phase:25,update:"The Sinbound Court",active:"none",active_ids:["contract_imp","sin_wraith","ledger_bailiff","ashen_advocate","the_accuser"],thresholds:{imp_sin_min:25,wraith_sin_min:75,bailiff_debt_min:35,bailiff_sin_min:25,accuser_sin_min:150},cooldowns:{imp:600,wraith:1200,bailiff:3000,advocate:1800,accuser:6000},rewards:{imp_debt_payment:1,wraith_sin_payment:3,bailiff_debt_payment:5,bailiff_sin_payment:2,advocate_sin_payment:4,accuser_sin_payment:25,accuser_debt_payment:12},last_result:"idle"}

scoreboard players add #court.active diab.mob 0
scoreboard players add #court.kind diab.mob 0
scoreboard players add #court.timer diab.mob 0
scoreboard players add #court.kills diab.mob 0
scoreboard players add #court.imp_cd diab.mob 0
scoreboard players add #court.wraith_cd diab.mob 0
scoreboard players add #court.bailiff_cd diab.mob 0
scoreboard players add #court.advocate_cd diab.mob 0
scoreboard players add #court.accuser_cd diab.mob 0

execute store result score #court.imp_sin diab.mob run data get storage diabolical:mobs thresholds.imp_sin_min
execute store result score #court.wraith_sin diab.mob run data get storage diabolical:mobs thresholds.wraith_sin_min
execute store result score #court.bailiff_debt diab.mob run data get storage diabolical:mobs thresholds.bailiff_debt_min
execute store result score #court.bailiff_sin diab.mob run data get storage diabolical:mobs thresholds.bailiff_sin_min
execute store result score #court.accuser_sin diab.mob run data get storage diabolical:mobs thresholds.accuser_sin_min
