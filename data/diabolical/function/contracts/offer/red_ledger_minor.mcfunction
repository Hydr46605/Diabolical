# Describes Red Ledger Minor.
tellraw @s [{"text":"Red Ledger Minor","color":"gold","bold":true},{"text":": receive emeralds and a Midas Coin. Diabolical Night may answer. Cost: +2 sin, +12 debt.","color":"gray","bold":false}]
tellraw @s [{"text":"  "},{"text":"[Sign]","color":"yellow","bold":true,"clickEvent":{"action":"run_command","value":"/trigger diab.accept set 3"},"hoverEvent":{"action":"show_text","contents":{"text":"Sign Red Ledger Minor"}}}]
