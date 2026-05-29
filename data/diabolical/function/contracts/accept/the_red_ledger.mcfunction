# Accepts The Red Ledger if the player can sign a major contract.
execute if entity @s[advancements={diabolical:contracts/major_unlocked=true}] run tag @s add diab.contracts_major_unlocked
execute unless entity @s[tag=diab.contracts_unlocked] run function diabolical:contracts/accept/fail_locked
execute if entity @s[tag=diab.contracts_unlocked] unless entity @s[tag=diab.contracts_major_unlocked] run function diabolical:contracts/accept/fail_major_locked
execute if entity @s[tag=diab.contracts_unlocked,tag=diab.contracts_major_unlocked,tag=diab.contract_active] run function diabolical:contracts/accept/fail_active
execute if entity @s[tag=diab.contracts_unlocked,tag=diab.contracts_major_unlocked,tag=!diab.contract_active] run function diabolical:contracts/accept/grant/the_red_ledger
