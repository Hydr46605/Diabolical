# Pays part of Pact of Copper if active.
execute unless entity @s[tag=diab.contract.pact_of_copper] run function diabolical:contracts/pay/fail_no_contract
execute if entity @s[tag=diab.contract.pact_of_copper] run function diabolical:contracts/pay/apply/pact_of_copper
