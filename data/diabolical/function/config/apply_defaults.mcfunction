# Initializes persistent system config once per world.
scoreboard players set #contracts diab.config 1
scoreboard players set #rituals diab.config 1
scoreboard players set #relics diab.config 1
scoreboard players set #events diab.config 1
scoreboard players set #mobs diab.config 1
scoreboard players set #profile diab.config 1
scoreboard players set #config.init diab.config 1
data merge storage diabolical:config {profile:"default",profile_id:1,systems:{contracts:1b,rituals:1b,relics:1b,events:1b,mobs:1b}}
