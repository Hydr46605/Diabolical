# Reveals guided debt recovery and spends one awakened compass charge.
advancement grant @s only diabolical:relics/first_relic
advancement grant @s only diabolical:relics/hellbound_compass
advancement grant @s only diabolical:relics/awakened_hellbound_compass
function diabolical:advancements/check/starter_relics
function diabolical:advancements/check/recovery_mastery
scoreboard players remove @s diab.rcharge 1
scoreboard players set @s diab.cooldown 80
scoreboard players set #amount diab.tmp 1
function diabolical:core/add_sin
effect give @s minecraft:glowing 20 0 true
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Awakened compass charge spent. Charges: ","color":"gray"},{"score":{"name":"@s","objective":"diab.rcharge"},"color":"white"}]
function diabolical:feedback/relic_used
tellraw @s [{"text":"Debt: ","color":"gray"},{"score":{"name":"@s","objective":"diab.debt"},"color":"white"},{"text":"  Contract debt: ","color":"gray"},{"score":{"name":"@s","objective":"diab.cdebt"},"color":"white"}]
execute if score @s diab.cdebt matches 1.. run tellraw @s [{"text":"Guidance: ","color":"gray"},{"text":"open Payments to reduce active contract debt before closing the pact.","color":"white"}]
execute if score @s diab.debt matches 1..9 run tellraw @s [{"text":"Guidance: ","color":"gray"},{"text":"Ashes Paid can clear a small balance cleanly.","color":"white"}]
execute if score @s diab.debt matches 10..49 run tellraw @s [{"text":"Guidance: ","color":"gray"},{"text":"Bell of Remission is efficient when both sin and debt are present.","color":"white"}]
execute if score @s diab.debt >= #collector.target_debt diab.event run tellraw @s [{"text":"Guidance: ","color":"gray"},{"text":"your current profile can attract collectors; pay down before the account is called.","color":"red"}]
execute if score @s diab.rcharge matches 0 run function diabolical:relics/break/awakened_hellbound_compass
