# Routes ritual input validation by trigger item.
execute if entity @s[nbt={Item:{id:"minecraft:paper",count:1}}] run function diabolical:rituals/check/first_signature_inputs
execute if entity @s[nbt={Item:{id:"minecraft:bone_meal",count:1}}] run function diabolical:rituals/check/ashes_paid_inputs
execute if entity @s[nbt={Item:{id:"minecraft:bell",count:1}}] run function diabolical:rituals/check/bell_of_remission_inputs
execute if entity @s[nbt={Item:{id:"minecraft:wither_rose",count:1}}] run function diabolical:rituals/check/red_moon_invitation_inputs
