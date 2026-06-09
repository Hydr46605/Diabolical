# Describes Greed Clause.
tellraw @s [{"text":"Greed Clause","color":"gold","bold":true},{"text":": immediate gold, one emerald, and luck while active. Cost: +2 sin, +14 debt.","color":"gray","bold":false}]
tellraw @s [{"text":"  "},{"text":"[Sign]","color":"yellow","bold":true,"clickEvent":{"action":"run_command","value":"/trigger diab.accept set 5"},"hoverEvent":{"action":"show_text","contents":{"text":"Sign Greed Clause"}}}]
