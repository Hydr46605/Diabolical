# Accepts Pact of Hunger if the player can sign a contract.
execute unless entity @s[tag=diab.contracts_unlocked] run function diabolical:contracts/accept/fail_locked
execute if entity @s[tag=diab.contracts_unlocked,tag=diab.contract_active] run function diabolical:contracts/accept/fail_active
execute if entity @s[tag=diab.contracts_unlocked,tag=!diab.contract_active] run function diabolical:contracts/accept/grant/pact_of_hunger
