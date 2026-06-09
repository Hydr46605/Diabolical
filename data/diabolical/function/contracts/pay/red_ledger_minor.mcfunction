# Pays part of Red Ledger Minor if active.
execute unless entity @s[tag=diab.contract.red_ledger_minor] run function diabolical:contracts/pay/fail_no_contract
execute if entity @s[tag=diab.contract.red_ledger_minor] run function diabolical:contracts/pay/apply/red_ledger_minor
