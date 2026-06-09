# Revokes Ashen Credit if it is active.
execute unless entity @s[tag=diab.contract.ashen_credit] run function diabolical:contracts/revoke/fail_no_contract
execute if entity @s[tag=diab.contract.ashen_credit] run function diabolical:contracts/revoke/apply/ashen_credit
