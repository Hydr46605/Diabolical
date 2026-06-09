# Clears Pact of Hunger state if active.
execute unless entity @s[tag=diab.contract.pact_of_hunger] run function diabolical:contracts/revoke/fail_no_contract
execute if entity @s[tag=diab.contract.pact_of_hunger] run function diabolical:contracts/revoke/apply/pact_of_hunger
