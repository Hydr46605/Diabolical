# Module bootstrap.
data merge storage diabolical:runtime {enabled:1b,version:"0.4.1-dev",phase:23,heartbeat:{enabled:1b,interval:"1s"}}

scoreboard players set #runtime diab.tick 0
scoreboard players set #heartbeat diab.tick 0

execute as @a[tag=!diab.player] run function diabolical:core/player_init
scoreboard players add @a diab.rcharge 0
scoreboard players add @a diab.kills 0
scoreboard players add @a diab.kwither 0
scoreboard players add @a diab.kphantom 0
scoreboard players add @a diab.kwitch 0
scoreboard players add @a diab.kzombie 0
execute as @a run function diabolical:advancements/check/progression_acts

schedule clear diabolical:core/heartbeat
schedule function diabolical:core/heartbeat 1s replace

function diabolical:contracts/init
function diabolical:rituals/init
function diabolical:relics/init
function diabolical:events/init
function diabolical:mobs/init
