# Applies Bailiff Bell and starts a Ledger Bailiff trial.
clear @s minecraft:bell[minecraft:custom_data={diabolical:{court_item:"bailiff_bell"}}] 1
function diabolical:feedback/court_item_used
function diabolical:mobs/summon/ledger_bailiff
