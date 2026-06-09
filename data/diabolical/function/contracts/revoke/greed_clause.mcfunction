# Clears Greed Clause state if active.
execute unless entity @s[tag=diab.contract.greed_clause] run function diabolical:contracts/revoke/fail_no_contract
execute if entity @s[tag=diab.contract.greed_clause] run function diabolical:contracts/revoke/apply/greed_clause
