# Routes non-operator player trigger commands.
scoreboard players enable @a diab.page
scoreboard players enable @a diab.accept
scoreboard players enable @a diab.pay
scoreboard players enable @a diab.revoke
scoreboard players enable @a diab.relic

execute as @a[scores={diab.page=1}] run function diabolical:interface/ledger/status
execute as @a[scores={diab.page=2}] run function diabolical:interface/ledger/contracts
execute as @a[scores={diab.page=3}] run function diabolical:interface/ledger/payments
execute as @a[scores={diab.page=4}] run function diabolical:interface/ledger/relics
execute as @a[scores={diab.page=5}] run function diabolical:interface/ledger/help

execute if score #contracts diab.config matches 1 as @a[scores={diab.accept=1}] run function diabolical:contracts/accept/pact_of_embers
execute if score #contracts diab.config matches 1 as @a[scores={diab.accept=2}] run function diabolical:contracts/accept/pact_of_hunger
execute if score #contracts diab.config matches 1 as @a[scores={diab.accept=3}] run function diabolical:contracts/accept/red_ledger_minor
execute if score #contracts diab.config matches 1 as @a[scores={diab.accept=4}] run function diabolical:contracts/accept/pact_of_copper
execute if score #contracts diab.config matches 1 as @a[scores={diab.accept=5}] run function diabolical:contracts/accept/greed_clause
execute if score #contracts diab.config matches 1 as @a[scores={diab.accept=6}] run function diabolical:contracts/accept/the_red_ledger

execute if score #contracts diab.config matches 1 as @a[scores={diab.pay=1}] run function diabolical:contracts/pay/pact_of_embers
execute if score #contracts diab.config matches 1 as @a[scores={diab.pay=2}] run function diabolical:contracts/pay/pact_of_hunger
execute if score #contracts diab.config matches 1 as @a[scores={diab.pay=3}] run function diabolical:contracts/pay/red_ledger_minor
execute if score #contracts diab.config matches 1 as @a[scores={diab.pay=4}] run function diabolical:contracts/pay/pact_of_copper
execute if score #contracts diab.config matches 1 as @a[scores={diab.pay=5}] run function diabolical:contracts/pay/greed_clause
execute if score #contracts diab.config matches 1 as @a[scores={diab.pay=6}] run function diabolical:contracts/pay/the_red_ledger

execute if score #contracts diab.config matches 1 as @a[scores={diab.revoke=1}] run function diabolical:contracts/revoke/pact_of_embers
execute if score #contracts diab.config matches 1 as @a[scores={diab.revoke=2}] run function diabolical:contracts/revoke/pact_of_hunger
execute if score #contracts diab.config matches 1 as @a[scores={diab.revoke=3}] run function diabolical:contracts/revoke/red_ledger_minor
execute if score #contracts diab.config matches 1 as @a[scores={diab.revoke=4}] run function diabolical:contracts/revoke/pact_of_copper
execute if score #contracts diab.config matches 1 as @a[scores={diab.revoke=5}] run function diabolical:contracts/revoke/greed_clause
execute if score #contracts diab.config matches 1 as @a[scores={diab.revoke=6}] run function diabolical:contracts/revoke/the_red_ledger

execute if score #contracts diab.config matches 0 as @a[scores={diab.accept=1..}] run function diabolical:interface/ledger/disabled/contracts
execute if score #contracts diab.config matches 0 as @a[scores={diab.pay=1..}] run function diabolical:interface/ledger/disabled/contracts
execute if score #contracts diab.config matches 0 as @a[scores={diab.revoke=1..}] run function diabolical:interface/ledger/disabled/contracts

execute if score #relics diab.config matches 1 as @a[scores={diab.relic=1}] run function diabolical:relics/use/ashen_charm
execute if score #relics diab.config matches 1 as @a[scores={diab.relic=2}] run function diabolical:relics/use/midas_coin
execute if score #relics diab.config matches 1 as @a[scores={diab.relic=3}] run function diabolical:relics/use/hellbound_compass
execute if score #relics diab.config matches 1 as @a[scores={diab.relic=4}] run function diabolical:relics/use/awakened_hellbound_compass
execute if score #relics diab.config matches 1 as @a[scores={diab.relic=5}] run function diabolical:relics/awaken/hellbound_compass
execute if score #relics diab.config matches 0 as @a[scores={diab.relic=1..}] run function diabolical:interface/ledger/disabled/relics

execute as @a[scores={diab.ledger=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{diabolical:{tool:"infernal_ledger"}}}}}] run function diabolical:interface/ledger/menu

scoreboard players set @a[scores={diab.page=1..}] diab.page 0
scoreboard players set @a[scores={diab.accept=1..}] diab.accept 0
scoreboard players set @a[scores={diab.pay=1..}] diab.pay 0
scoreboard players set @a[scores={diab.revoke=1..}] diab.revoke 0
scoreboard players set @a[scores={diab.relic=1..}] diab.relic 0
scoreboard players set @a[scores={diab.ledger=1..}] diab.ledger 0
