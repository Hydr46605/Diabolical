# Clears the active Sinbound Court encounter.
data merge storage diabolical:mobs {active:"none",last_result:"stopped"}
scoreboard players set #court.active diab.mob 0
scoreboard players set #court.kind diab.mob 0
scoreboard players set #court.timer diab.mob 0
scoreboard players set #court.kills diab.mob 0
tag @a remove diab.court_target
kill @e[tag=diab.court_mob]
