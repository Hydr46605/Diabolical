# Grants recovery mastery once the player has used the main recovery tools.
execute if entity @s[advancements={diabolical:rituals/ashes_paid=true,diabolical:rituals/bell_of_remission=true,diabolical:relics/awakened_hellbound_compass=true}] run advancement grant @s only diabolical:mastery/recovery_mastery
