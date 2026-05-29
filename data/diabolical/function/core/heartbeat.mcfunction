# Scheduled heartbeat for periodic systems. Re-schedules itself while enabled.
execute if data storage diabolical:runtime enabled run scoreboard players add #heartbeat diab.tick 1
execute if data storage diabolical:runtime enabled as @a[tag=!diab.player] run function diabolical:core/player_init
execute if data storage diabolical:runtime enabled run schedule function diabolical:core/heartbeat 1s replace
