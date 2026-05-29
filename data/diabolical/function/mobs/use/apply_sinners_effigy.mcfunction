# Applies Sinners Effigy and starts a Sin Wraith trial.
clear @s minecraft:armor_stand[minecraft:custom_data={diabolical:{court_item:"sinners_effigy"}}] 1
effect give @s minecraft:resistance 8 0 true
function diabolical:mobs/summon/sin_wraith
