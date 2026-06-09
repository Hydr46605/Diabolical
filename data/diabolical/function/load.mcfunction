# Diabolical load hook. Runs on world load and /reload.
scoreboard objectives add diab.tick dummy
scoreboard objectives add diab.sin dummy
scoreboard objectives add diab.debt dummy
scoreboard objectives add diab.cooldown dummy
scoreboard objectives add diab.rcharge dummy
scoreboard objectives add diab.contract dummy
scoreboard objectives add diab.cdebt dummy
scoreboard objectives add diab.btithe dummy
scoreboard objectives add diab.hp dummy
scoreboard objectives add diab.gravecd dummy
scoreboard objectives add diab.event dummy
scoreboard objectives add diab.mob dummy
scoreboard objectives add diab.tmp dummy
scoreboard objectives add diab.config dummy
scoreboard objectives add diab.kills minecraft.killed:minecraft.skeleton
scoreboard objectives add diab.kwither minecraft.killed:minecraft.wither_skeleton
scoreboard objectives add diab.kphantom minecraft.killed:minecraft.phantom
scoreboard objectives add diab.kwitch minecraft.killed:minecraft.witch
scoreboard objectives add diab.kzombie minecraft.killed:minecraft.zombie
scoreboard objectives add diab.ledger minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add diab.page trigger
scoreboard objectives add diab.accept trigger
scoreboard objectives add diab.pay trigger
scoreboard objectives add diab.revoke trigger
scoreboard objectives add diab.relic trigger
scoreboard objectives add diab.court trigger

function diabolical:config/defaults
function diabolical:core/init

tellraw @a [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Base systems loaded.","color":"gray"}]
