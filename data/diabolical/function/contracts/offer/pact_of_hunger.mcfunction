# Describes Pact of Hunger.
tellraw @s [{"text":"Pact of Hunger","color":"gold","bold":true},{"text":": strength while active; hunger follows. Cost: +1 sin, +6 debt.","color":"gray","bold":false}]
tellraw @s [{"text":"  "},{"text":"[Sign]","color":"yellow","bold":true,"clickEvent":{"action":"run_command","value":"/trigger diab.accept set 2"},"hoverEvent":{"action":"show_text","contents":{"text":"Sign Pact of Hunger"}}}]
