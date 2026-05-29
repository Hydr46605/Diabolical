# Default config. Admin config functions can override system scores later.
data merge storage diabolical:config {version:"0.4.1-dev",debug:0b}

scoreboard players add #config.init diab.config 0
execute if score #config.init diab.config matches 0 run function diabolical:config/apply_defaults

execute if score #contracts diab.config matches 1 run data merge storage diabolical:config {systems:{contracts:1b}}
execute unless score #contracts diab.config matches 1 run data merge storage diabolical:config {systems:{contracts:0b}}
execute if score #rituals diab.config matches 1 run data merge storage diabolical:config {systems:{rituals:1b}}
execute unless score #rituals diab.config matches 1 run data merge storage diabolical:config {systems:{rituals:0b}}
execute if score #relics diab.config matches 1 run data merge storage diabolical:config {systems:{relics:1b}}
execute unless score #relics diab.config matches 1 run data merge storage diabolical:config {systems:{relics:0b}}
execute if score #events diab.config matches 1 run data merge storage diabolical:config {systems:{events:1b}}
execute unless score #events diab.config matches 1 run data merge storage diabolical:config {systems:{events:0b}}
execute if score #mobs diab.config matches 1 run data merge storage diabolical:config {systems:{mobs:1b}}
execute unless score #mobs diab.config matches 1 run data merge storage diabolical:config {systems:{mobs:0b}}
