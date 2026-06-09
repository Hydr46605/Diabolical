# Revokes Grave Collateral if it is active.
execute unless entity @s[tag=diab.contract.grave_collateral] run function diabolical:contracts/revoke/fail_no_contract
execute if entity @s[tag=diab.contract.grave_collateral] run function diabolical:contracts/revoke/apply/grave_collateral
