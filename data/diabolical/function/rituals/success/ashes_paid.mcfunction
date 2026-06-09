# Pays a small amount of the nearest player's debt.
data merge storage diabolical:rituals {last_result:"ashes_paid_success"}

scoreboard players set @a[distance=..8,limit=1,sort=nearest] diab.cooldown 80
execute as @a[distance=..8,limit=1,sort=nearest] run advancement grant @s only diabolical:rituals/ashes_paid
execute as @a[distance=..8,limit=1,sort=nearest] run function diabolical:advancements/check/recovery_mastery
scoreboard players set #amount diab.tmp 10
execute as @a[distance=..8,limit=1,sort=nearest] run function diabolical:core/pay_debt

particle minecraft:happy_villager ~ ~0.4 ~ 0.6 0.4 0.6 0.02 18 force
playsound minecraft:block.beacon.power_select master @a[distance=..12] ~ ~ ~ 0.7 1.3
tellraw @a[distance=..8,limit=1,sort=nearest] [{"text":"[Diabolical] ","color":"dark_red"},{"text":"The ledger accepts payment.","color":"gray"}]

scoreboard players reset #ritual.altar diab.tmp
scoreboard players reset #ritual.inputs diab.tmp
scoreboard players reset #ritual.owner_debt diab.tmp

kill @e[type=item,tag=diab.altar_item,distance=..1.25]
