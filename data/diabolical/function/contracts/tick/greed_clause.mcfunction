# Greed Clause: luck while active, but severe debt marks the account.
effect give @s minecraft:luck 3 0 true
execute if score @s diab.debt matches 50.. run effect give @s minecraft:glowing 3 0 true
