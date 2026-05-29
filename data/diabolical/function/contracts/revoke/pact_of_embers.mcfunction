# Clears Pact of Embers state if active.
execute unless entity @s[tag=diab.contract.pact_of_embers] run function diabolical:contracts/revoke/fail_no_contract
execute if entity @s[tag=diab.contract.pact_of_embers] run function diabolical:contracts/revoke/apply/pact_of_embers
