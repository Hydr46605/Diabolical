# Applies Black Writ and names the player in The Accuser's court.
clear @s minecraft:paper[minecraft:custom_data={diabolical:{court_item:"black_writ"}}] 1
scoreboard players set #amount diab.tmp 6
function diabolical:core/add_sin
function diabolical:mobs/summon/the_accuser
