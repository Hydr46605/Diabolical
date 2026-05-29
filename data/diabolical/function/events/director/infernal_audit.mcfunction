# Emits a non-destructive warning when group pressure is high.
data merge storage diabolical:events {director:{last_warning:"infernal_audit"}}
execute store result score #audit.cooldown diab.event run data get storage diabolical:events director.audit_cooldown_ticks
execute as @a run advancement grant @s only diabolical:events/infernal_audit
execute as @a run function diabolical:advancements/check/collector_mastery
tellraw @a [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Infernal Audit: group pressure is high. Debt total ","color":"gray"},{"score":{"name":"#director.debt","objective":"diab.event"},"color":"white"},{"text":", sin total ","color":"gray"},{"score":{"name":"#director.sin","objective":"diab.event"},"color":"white"},{"text":". Pay down before the ledger escalates.","color":"gray"}]
title @a actionbar {"text":"Infernal Audit warning issued.","color":"dark_red"}
execute as @a at @s run playsound minecraft:block.bell.resonate master @s ~ ~ ~ 0.8 0.6
execute as @a at @s run particle minecraft:ash ~ ~1 ~ 0.8 0.5 0.8 0.02 16 force @s
execute as @a[scores={diab.debt=50..}] at @s run particle minecraft:soul ~ ~1 ~ 0.6 0.5 0.6 0.01 12 force @s
execute as @a[scores={diab.sin=75..}] at @s run particle minecraft:soul_fire_flame ~ ~1 ~ 0.5 0.4 0.5 0.02 12 force @s
execute if score #mobs diab.config matches 1 unless score #court.active diab.mob matches 1 as @a[scores={diab.sin=75..},limit=1,sort=random] run function diabolical:mobs/summon/ashen_advocate
