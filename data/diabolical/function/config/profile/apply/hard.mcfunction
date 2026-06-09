# Applies a harder server profile without operator feedback.
scoreboard players set #profile diab.config 2
data merge storage diabolical:config {profile:"hard",profile_id:2}
data merge storage diabolical:events {diabolical_night:{duration_ticks:1100,reward_debt_payment:3,cooldown_ticks:4500,target_debt_min:5,target_sin_min:18,trigger:"red_ledger_minor"},debt_collector:{duration_ticks:1400,reward_debt_payment:6,cooldown_ticks:4500,target_debt_min:40,severe_debt_min:80,trigger:"severe_debt"},director:{audit_cooldown_ticks:1800,audit_debt_min:90,audit_sin_min:65,backlash_cooldown_ticks:140}}
data merge storage diabolical:mobs {thresholds:{imp_sin_min:18,wraith_sin_min:60,bailiff_debt_min:25,bailiff_sin_min:18,accuser_sin_min:120},cooldowns:{imp:400,wraith:900,bailiff:2200,advocate:1200,accuser:4200},rewards:{imp_debt_payment:1,wraith_sin_payment:2,bailiff_debt_payment:4,bailiff_sin_payment:1,advocate_sin_payment:3,accuser_sin_payment:18,accuser_debt_payment:8}}
function diabolical:config/profile/sync_scores
