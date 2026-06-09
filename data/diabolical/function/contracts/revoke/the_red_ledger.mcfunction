# Clears The Red Ledger state if active.
execute unless entity @s[tag=diab.contract.the_red_ledger] run function diabolical:contracts/revoke/fail_no_contract
execute if entity @s[tag=diab.contract.the_red_ledger] run function diabolical:contracts/revoke/apply/the_red_ledger
