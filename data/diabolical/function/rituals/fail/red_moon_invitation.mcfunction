# Risky failure for invalid Red Moon Invitation attempts. Offerings are not consumed.
data merge storage diabolical:rituals {last_result:"red_moon_invitation_failed"}

scoreboard players set @a[distance=..8,limit=1,sort=nearest] diab.cooldown 60

particle minecraft:smoke ~ ~0.4 ~ 0.45 0.3 0.45 0.02 18 force
playsound minecraft:block.respawn_anchor.deplete master @a[distance=..10] ~ ~ ~ 0.7 0.8
tellraw @a[distance=..8,limit=1,sort=nearest] [{"text":"[Diabolical] ","color":"dark_red"},{"text":"The red moon refuses the offering. Backlash follows bad invitations.","color":"gray"}]
execute if score #events diab.config matches 1 unless score #backlash.cooldown diab.event matches 1.. as @a[distance=..8,limit=1,sort=nearest] at @s run function diabolical:events/backlash/ritual_red_moon

function diabolical:rituals/cleanup/red_moon_invitation
