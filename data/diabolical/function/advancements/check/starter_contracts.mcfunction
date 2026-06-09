# Grants the starter-contract mastery challenge once all starter contracts were signed.
execute if entity @s[advancements={diabolical:contracts/pact_of_embers=true,diabolical:contracts/pact_of_hunger=true,diabolical:contracts/red_ledger_minor=true}] run advancement grant @s only diabolical:mastery/starter_contracts
