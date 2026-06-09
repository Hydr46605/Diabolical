# Removes temporary ritual tags near the executing trigger.
tag @e[type=item,tag=diab.ritual_trigger,distance=..2] remove diab.ritual_trigger
tag @e[type=item,tag=diab.altar_item,distance=..2] remove diab.altar_item

scoreboard players reset #ritual.altar diab.tmp
scoreboard players reset #ritual.inputs diab.tmp
scoreboard players reset #ritual.owner_debt diab.tmp
