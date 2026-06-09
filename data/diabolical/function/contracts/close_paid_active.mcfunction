# Closes whichever active contract has been fully paid by any debt-payment route.
execute if entity @s[tag=diab.contract.the_red_ledger] run advancement grant @s only diabolical:mastery/major_contracts
execute if entity @s[tag=diab.contract.grave_collateral] run advancement grant @s only diabolical:mastery/major_contracts
function diabolical:feedback/contract_closed
execute if entity @s[tag=diab.contract.pact_of_embers] run function diabolical:contracts/revoke/apply/pact_of_embers
execute if entity @s[tag=diab.contract.pact_of_hunger] run function diabolical:contracts/revoke/apply/pact_of_hunger
execute if entity @s[tag=diab.contract.red_ledger_minor] run function diabolical:contracts/revoke/apply/red_ledger_minor
execute if entity @s[tag=diab.contract.pact_of_copper] run function diabolical:contracts/revoke/apply/pact_of_copper
execute if entity @s[tag=diab.contract.greed_clause] run function diabolical:contracts/revoke/apply/greed_clause
execute if entity @s[tag=diab.contract.the_red_ledger] run function diabolical:contracts/revoke/apply/the_red_ledger
execute if entity @s[tag=diab.contract.blood_tithe] run function diabolical:contracts/revoke/apply/blood_tithe
execute if entity @s[tag=diab.contract.ashen_credit] run function diabolical:contracts/revoke/apply/ashen_credit
execute if entity @s[tag=diab.contract.grave_collateral] run function diabolical:contracts/revoke/apply/grave_collateral
