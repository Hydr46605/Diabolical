# Pays part of Pact of Hunger if active.
execute unless entity @s[tag=diab.contract.pact_of_hunger] run function diabolical:contracts/pay/fail_no_contract
execute if entity @s[tag=diab.contract.pact_of_hunger] run function diabolical:contracts/pay/apply/pact_of_hunger
