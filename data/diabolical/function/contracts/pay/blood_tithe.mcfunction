# Pays Blood Tithe if it is active.
execute unless entity @s[tag=diab.contract.blood_tithe] run function diabolical:contracts/pay/fail_no_contract
execute if entity @s[tag=diab.contract.blood_tithe] run function diabolical:contracts/pay/apply/blood_tithe
