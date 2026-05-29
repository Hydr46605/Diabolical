# Pays part of The Red Ledger if active.
execute unless entity @s[tag=diab.contract.the_red_ledger] run function diabolical:contracts/pay/fail_no_contract
execute if entity @s[tag=diab.contract.the_red_ledger] run function diabolical:contracts/pay/apply/the_red_ledger
