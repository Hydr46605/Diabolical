# Reports that the player has not reached collector priority.
tellraw @s [{"text":"[Diabolical] ","color":"dark_red"},{"text":"Your balance is not severe enough for a collector. Collector threshold: ","color":"gray"},{"score":{"name":"#collector.target_debt","objective":"diab.event"},"color":"white"}]
