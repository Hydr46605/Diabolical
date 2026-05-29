# Starts a deliberate Diabolical Night from the nearest player's invitation.
data merge storage diabolical:rituals {last_result:"red_moon_invitation_success"}

scoreboard players set @a[distance=..8,limit=1,sort=nearest] diab.cooldown 240
execute as @a[distance=..8,limit=1,sort=nearest] run advancement grant @s only diabolical:events/red_moon_invitation

scoreboard players set #amount diab.tmp 3
execute as @a[distance=..8,limit=1,sort=nearest] run function diabolical:core/add_sin
scoreboard players set #amount diab.tmp 6
execute as @a[distance=..8,limit=1,sort=nearest] run function diabolical:core/add_debt

particle minecraft:soul_fire_flame ~ ~0.4 ~ 0.7 0.5 0.7 0.03 30 force
playsound minecraft:block.respawn_anchor.charge master @a[distance=..12] ~ ~ ~ 0.8 0.7
tellraw @a[distance=..8,limit=1,sort=nearest] [{"text":"[Diabolical] ","color":"dark_red"},{"text":"The red moon accepts the invitation.","color":"gray"}]
function diabolical:events/start/diabolical_night
tag @a[distance=..8,limit=1,sort=nearest] add diab.event_forced
tag @a[distance=..8,limit=1,sort=nearest] add diab.event_target
tag @a[distance=..8,limit=1,sort=nearest] add diab.event_survivor
execute as @a[distance=..8,limit=1,sort=nearest] run advancement grant @s only diabolical:events/diabolical_night

scoreboard players reset #amount diab.tmp
scoreboard players reset #ritual.altar diab.tmp
scoreboard players reset #ritual.inputs diab.tmp
scoreboard players reset #ritual.event_ready diab.tmp

kill @e[type=item,tag=diab.altar_item,distance=..1.25]
