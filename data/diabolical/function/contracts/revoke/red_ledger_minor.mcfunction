# Clears Red Ledger Minor state if active.
execute unless entity @s[tag=diab.contract.red_ledger_minor] run function diabolical:contracts/revoke/fail_no_contract
execute if entity @s[tag=diab.contract.red_ledger_minor] run function diabolical:contracts/revoke/apply/red_ledger_minor
