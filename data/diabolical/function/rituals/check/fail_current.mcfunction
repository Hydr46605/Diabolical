# Routes a failed altar/input check to the active ritual's failure function.
execute if entity @s[nbt={Item:{id:"minecraft:paper",count:1}}] run function diabolical:rituals/fail/first_signature
execute if entity @s[nbt={Item:{id:"minecraft:bone_meal",count:1}}] run function diabolical:rituals/fail/ashes_paid
execute if entity @s[nbt={Item:{id:"minecraft:bell",count:1}}] run function diabolical:rituals/fail/bell_of_remission
execute if entity @s[nbt={Item:{id:"minecraft:wither_rose",count:1}}] run function diabolical:rituals/fail/red_moon_invitation
