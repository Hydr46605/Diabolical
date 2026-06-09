# Describes Pact of Embers.
tellraw @s [{"text":"Pact of Embers","color":"gold","bold":true},{"text":": fire resistance and an Ashen Charm. Water gives weakness. Cost: +2 sin, +8 debt.","color":"gray","bold":false}]
tellraw @s [{"text":"  "},{"text":"[Sign]","color":"yellow","bold":true,"clickEvent":{"action":"run_command","value":"/trigger diab.accept set 1"},"hoverEvent":{"action":"show_text","contents":{"text":"Sign Pact of Embers"}}}]
