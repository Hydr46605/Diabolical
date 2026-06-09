# Soft failure for invalid First Signature attempts. Offerings are not consumed.
data merge storage diabolical:rituals {last_result:"first_signature_failed"}

scoreboard players set @a[distance=..8,limit=1,sort=nearest] diab.cooldown 40

particle minecraft:smoke ~ ~0.4 ~ 0.35 0.25 0.35 0.01 12 force
playsound minecraft:block.fire.extinguish master @a[distance=..10] ~ ~ ~ 0.6 0.8
tellraw @a[distance=..8,limit=1,sort=nearest] [{"text":"[Diabolical] ","color":"dark_red"},{"text":"The altar rejects the offering.","color":"gray"}]

function diabolical:rituals/cleanup/first_signature
