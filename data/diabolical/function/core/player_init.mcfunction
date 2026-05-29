# Initializes player-owned Diabolical state once.
tag @s add diab.player

scoreboard players add @s diab.sin 0
scoreboard players add @s diab.debt 0
scoreboard players add @s diab.cooldown 0
scoreboard players add @s diab.rcharge 0
scoreboard players add @s diab.contract 0
scoreboard players add @s diab.cdebt 0
scoreboard players set @s diab.ledger 0
scoreboard players set @s diab.accept 0
scoreboard players set @s diab.pay 0
scoreboard players set @s diab.revoke 0
scoreboard players set @s diab.relic 0
scoreboard players set @s diab.kills 0

function diabolical:progression/give/infernal_primer
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"You have been marked by the ledger. The Infernal Primer explains the first altar.","color":"gray"}]
