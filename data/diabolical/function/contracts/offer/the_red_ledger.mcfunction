# Describes The Red Ledger major contract.
tellraw @s [{"text":"The Red Ledger","color":"dark_red","bold":true},{"text":": major payout, severe debt, and collector attention until paid. Cost: +4 sin, +60 debt.","color":"gray","bold":false}]
tellraw @s [{"text":"  "},{"text":"[Sign Major]","color":"red","bold":true,"clickEvent":{"action":"run_command","value":"/trigger diab.accept set 6"},"hoverEvent":{"action":"show_text","contents":{"text":"Sign The Red Ledger"}}}]
