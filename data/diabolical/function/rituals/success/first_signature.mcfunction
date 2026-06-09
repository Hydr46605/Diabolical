# Completes the first ritual and unlocks the early contracts path.
data merge storage diabolical:rituals {last_result:"first_signature_success"}

tag @a[distance=..8,limit=1,sort=nearest] add diab.contracts_unlocked
scoreboard players set @a[distance=..8,limit=1,sort=nearest] diab.cooldown 100
execute as @a[distance=..8,limit=1,sort=nearest] run advancement grant @s only diabolical:rituals/first_signature
execute as @a[distance=..8,limit=1,sort=nearest] run advancement grant @s only diabolical:contracts/unlocked
execute as @a[distance=..8,limit=1,sort=nearest] run advancement grant @s only diabolical:acts/debt_pressure
execute as @a[distance=..8,limit=1,sort=nearest] run advancement grant @s only diabolical:acts/relics
execute as @a[distance=..8,limit=1,sort=nearest] run advancement grant @s only diabolical:acts/nights
execute as @a[distance=..8,limit=1,sort=nearest] run advancement grant @s only diabolical:acts/major_contracts
execute as @a[distance=..8,limit=1,sort=nearest] run function diabolical:contracts/give/infernal_ledger
execute as @a[distance=..8,limit=1,sort=nearest] run function diabolical:relics/give/hellbound_compass
scoreboard players set #amount diab.tmp 1
execute as @a[distance=..8,limit=1,sort=nearest] run function diabolical:core/add_sin
scoreboard players set #amount diab.tmp 3
execute as @a[distance=..8,limit=1,sort=nearest] run function diabolical:core/add_debt

particle minecraft:soul_fire_flame ~ ~0.4 ~ 0.6 0.4 0.6 0.02 24 force
playsound minecraft:block.enchantment_table.use master @a[distance=..12] ~ ~ ~ 0.8 0.7
tellraw @a[distance=..8,limit=1,sort=nearest] [{"text":"[Diabolical] ","color":"dark_red"},{"text":"The ledger opens. Right-click it, open Contracts, then choose one minor pact.","color":"gray"}]
execute as @a[distance=..8,limit=1,sort=nearest] run function diabolical:contracts/offer/menu

scoreboard players reset #ritual.altar diab.tmp
scoreboard players reset #ritual.inputs diab.tmp

kill @e[type=item,tag=diab.altar_item,distance=..1.25]
