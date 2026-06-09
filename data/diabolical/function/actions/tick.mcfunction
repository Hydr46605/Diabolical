# Routes non-operator player trigger commands.
scoreboard players enable @a diab.page
scoreboard players enable @a diab.accept
scoreboard players enable @a diab.pay
scoreboard players enable @a diab.revoke
scoreboard players enable @a diab.relic
scoreboard players enable @a diab.court

execute as @a[scores={diab.page=1}] run function diabolical:interface/ledger/status
execute as @a[scores={diab.page=2}] run function diabolical:interface/ledger/contracts
execute as @a[scores={diab.page=3}] run function diabolical:interface/ledger/payments
execute as @a[scores={diab.page=4}] run function diabolical:interface/ledger/relics
execute as @a[scores={diab.page=5}] run function diabolical:interface/ledger/help
execute as @a[scores={diab.page=6}] run function diabolical:interface/ledger/court

execute if score #contracts diab.config matches 1 as @a[scores={diab.accept=1}] run function diabolical:contracts/accept/pact_of_embers
execute if score #contracts diab.config matches 1 as @a[scores={diab.accept=2}] run function diabolical:contracts/accept/pact_of_hunger
execute if score #contracts diab.config matches 1 as @a[scores={diab.accept=3}] run function diabolical:contracts/accept/red_ledger_minor
execute if score #contracts diab.config matches 1 as @a[scores={diab.accept=4}] run function diabolical:contracts/accept/pact_of_copper
execute if score #contracts diab.config matches 1 as @a[scores={diab.accept=5}] run function diabolical:contracts/accept/greed_clause
execute if score #contracts diab.config matches 1 as @a[scores={diab.accept=6}] run function diabolical:contracts/accept/the_red_ledger
execute if score #contracts diab.config matches 1 as @a[scores={diab.accept=7}] run function diabolical:contracts/accept/blood_tithe
execute if score #contracts diab.config matches 1 as @a[scores={diab.accept=8}] run function diabolical:contracts/accept/ashen_credit
execute if score #contracts diab.config matches 1 as @a[scores={diab.accept=9}] run function diabolical:contracts/accept/grave_collateral

execute if score #contracts diab.config matches 1 as @a[scores={diab.pay=1}] run function diabolical:contracts/pay/pact_of_embers
execute if score #contracts diab.config matches 1 as @a[scores={diab.pay=2}] run function diabolical:contracts/pay/pact_of_hunger
execute if score #contracts diab.config matches 1 as @a[scores={diab.pay=3}] run function diabolical:contracts/pay/red_ledger_minor
execute if score #contracts diab.config matches 1 as @a[scores={diab.pay=4}] run function diabolical:contracts/pay/pact_of_copper
execute if score #contracts diab.config matches 1 as @a[scores={diab.pay=5}] run function diabolical:contracts/pay/greed_clause
execute if score #contracts diab.config matches 1 as @a[scores={diab.pay=6}] run function diabolical:contracts/pay/the_red_ledger
execute if score #contracts diab.config matches 1 as @a[scores={diab.pay=7}] run function diabolical:contracts/pay/blood_tithe
execute if score #contracts diab.config matches 1 as @a[scores={diab.pay=8}] run function diabolical:contracts/pay/ashen_credit
execute if score #contracts diab.config matches 1 as @a[scores={diab.pay=9}] run function diabolical:contracts/pay/grave_collateral

execute if score #contracts diab.config matches 1 as @a[scores={diab.revoke=1}] run function diabolical:contracts/revoke/pact_of_embers
execute if score #contracts diab.config matches 1 as @a[scores={diab.revoke=2}] run function diabolical:contracts/revoke/pact_of_hunger
execute if score #contracts diab.config matches 1 as @a[scores={diab.revoke=3}] run function diabolical:contracts/revoke/red_ledger_minor
execute if score #contracts diab.config matches 1 as @a[scores={diab.revoke=4}] run function diabolical:contracts/revoke/pact_of_copper
execute if score #contracts diab.config matches 1 as @a[scores={diab.revoke=5}] run function diabolical:contracts/revoke/greed_clause
execute if score #contracts diab.config matches 1 as @a[scores={diab.revoke=6}] run function diabolical:contracts/revoke/the_red_ledger
execute if score #contracts diab.config matches 1 as @a[scores={diab.revoke=7}] run function diabolical:contracts/revoke/blood_tithe
execute if score #contracts diab.config matches 1 as @a[scores={diab.revoke=8}] run function diabolical:contracts/revoke/ashen_credit
execute if score #contracts diab.config matches 1 as @a[scores={diab.revoke=9}] run function diabolical:contracts/revoke/grave_collateral

execute if score #contracts diab.config matches 0 as @a[scores={diab.accept=1..}] run function diabolical:interface/ledger/disabled/contracts
execute if score #contracts diab.config matches 0 as @a[scores={diab.pay=1..}] run function diabolical:interface/ledger/disabled/contracts
execute if score #contracts diab.config matches 0 as @a[scores={diab.revoke=1..}] run function diabolical:interface/ledger/disabled/contracts

execute if score #relics diab.config matches 1 as @a[scores={diab.relic=1}] run function diabolical:relics/use/ashen_charm
execute if score #relics diab.config matches 1 as @a[scores={diab.relic=2}] run function diabolical:relics/use/midas_coin
execute if score #relics diab.config matches 1 as @a[scores={diab.relic=3}] run function diabolical:relics/use/hellbound_compass
execute if score #relics diab.config matches 1 as @a[scores={diab.relic=4}] run function diabolical:relics/use/awakened_hellbound_compass
execute if score #relics diab.config matches 1 as @a[scores={diab.relic=5}] run function diabolical:relics/awaken/hellbound_compass
execute if score #relics diab.config matches 0 as @a[scores={diab.relic=1..}] run function diabolical:interface/ledger/disabled/relics

execute if score #mobs diab.config matches 1 as @a[scores={diab.court=1}] run function diabolical:mobs/use/black_writ
execute if score #mobs diab.config matches 1 as @a[scores={diab.court=2}] run function diabolical:mobs/use/court_candle
execute if score #mobs diab.config matches 1 as @a[scores={diab.court=3}] run function diabolical:mobs/use/bailiff_bell
execute if score #mobs diab.config matches 1 as @a[scores={diab.court=4}] run function diabolical:mobs/use/sinners_effigy
execute if score #mobs diab.config matches 1 as @a[scores={diab.court=5}] run function diabolical:mobs/use/ashen_brief
execute if score #mobs diab.config matches 1 as @a[scores={diab.court=6}] run function diabolical:mobs/use/accusers_seal
execute if score #mobs diab.config matches 0 as @a[scores={diab.court=1..}] run function diabolical:interface/ledger/disabled/mobs

execute as @a[scores={diab.ledger=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{diabolical:{tool:"infernal_ledger"}}}}}] run function diabolical:interface/ledger/menu

scoreboard players set @a[scores={diab.page=1..}] diab.page 0
scoreboard players set @a[scores={diab.accept=1..}] diab.accept 0
scoreboard players set @a[scores={diab.pay=1..}] diab.pay 0
scoreboard players set @a[scores={diab.revoke=1..}] diab.revoke 0
scoreboard players set @a[scores={diab.relic=1..}] diab.relic 0
scoreboard players set @a[scores={diab.court=1..}] diab.court 0
scoreboard players set @a[scores={diab.ledger=1..}] diab.ledger 0
