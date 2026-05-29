# Cleanses the nearest player's sin and pays part of their debt.
data merge storage diabolical:rituals {last_result:"bell_of_remission_success"}

scoreboard players set @a[distance=..8,limit=1,sort=nearest] diab.cooldown 160
execute as @a[distance=..8,limit=1,sort=nearest] run advancement grant @s only diabolical:rituals/bell_of_remission
execute as @a[distance=..8,limit=1,sort=nearest] run function diabolical:advancements/check/recovery_mastery

scoreboard players set #amount diab.tmp 15
execute as @a[distance=..8,limit=1,sort=nearest] if score @s diab.debt matches 1.. run function diabolical:core/pay_debt
scoreboard players set #amount diab.tmp 5
execute as @a[distance=..8,limit=1,sort=nearest] if score @s diab.sin matches 1.. run function diabolical:core/pay_sin

particle minecraft:enchant ~ ~0.5 ~ 0.7 0.5 0.7 0.03 30 force
playsound minecraft:block.amethyst_block.chime master @a[distance=..12] ~ ~ ~ 0.8 1.1
tellraw @a[distance=..8,limit=1,sort=nearest] [{"text":"[Diabolical] ","color":"dark_red"},{"text":"The bell rings once. The ledger records remission.","color":"gray"}]

scoreboard players reset #amount diab.tmp
scoreboard players reset #ritual.altar diab.tmp
scoreboard players reset #ritual.inputs diab.tmp
scoreboard players reset #ritual.owner_debt diab.tmp
scoreboard players reset #ritual.owner_sin diab.tmp

kill @e[type=item,tag=diab.altar_item,distance=..1.25]
