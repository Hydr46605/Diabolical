# Soft failure for invalid Bell of Remission attempts. Offerings are not consumed.
data merge storage diabolical:rituals {last_result:"bell_of_remission_failed"}

scoreboard players set @a[distance=..8,limit=1,sort=nearest] diab.cooldown 40

particle minecraft:smoke ~ ~0.4 ~ 0.35 0.25 0.35 0.01 12 force
playsound minecraft:block.bell.resonate master @a[distance=..10] ~ ~ ~ 0.6 0.7
tellraw @a[distance=..8,limit=1,sort=nearest] [{"text":"[Diabolical] ","color":"dark_red"},{"text":"The bell finds no stain or unpaid balance in this offering.","color":"gray"}]
execute if score #events diab.config matches 1 unless score #backlash.cooldown diab.event matches 1.. as @a[distance=..8,limit=1,sort=nearest] at @s run function diabolical:events/backlash/ritual_minor

function diabolical:rituals/cleanup/bell_of_remission
