# Pays Grave Collateral if it is active.
execute unless entity @s[tag=diab.contract.grave_collateral] run function diabolical:contracts/pay/fail_no_contract
execute if entity @s[tag=diab.contract.grave_collateral] run function diabolical:contracts/pay/apply/grave_collateral
