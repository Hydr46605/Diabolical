# Pays part of Greed Clause if active.
execute unless entity @s[tag=diab.contract.greed_clause] run function diabolical:contracts/pay/fail_no_contract
execute if entity @s[tag=diab.contract.greed_clause] run function diabolical:contracts/pay/apply/greed_clause
