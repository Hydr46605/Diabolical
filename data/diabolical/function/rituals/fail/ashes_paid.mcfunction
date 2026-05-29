# Soft failure for invalid Ashes Paid attempts. Offerings are not consumed.
data merge storage diabolical:rituals {last_result:"ashes_paid_failed"}

scoreboard players set @a[distance=..8,limit=1,sort=nearest] diab.cooldown 40

particle minecraft:smoke ~ ~0.4 ~ 0.35 0.25 0.35 0.01 12 force
playsound minecraft:block.fire.extinguish master @a[distance=..10] ~ ~ ~ 0.6 0.9
tellraw @a[distance=..8,limit=1,sort=nearest] [{"text":"[Diabolical] ","color":"dark_red"},{"text":"The ledger finds no payable balance in this offering.","color":"gray"}]

function diabolical:rituals/cleanup/ashes_paid
