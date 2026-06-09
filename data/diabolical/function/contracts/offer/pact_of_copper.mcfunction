# Describes Pact of Copper.
tellraw @s [{"text":"Pact of Copper","color":"gold","bold":true},{"text":": haste when standing on or beside copper blocks. Cost: +1 sin, +7 debt.","color":"gray","bold":false}]
tellraw @s [{"text":"  "},{"text":"[Sign]","color":"yellow","bold":true,"clickEvent":{"action":"run_command","value":"/trigger diab.accept set 4"},"hoverEvent":{"action":"show_text","contents":{"text":"Sign Pact of Copper"}}}]
