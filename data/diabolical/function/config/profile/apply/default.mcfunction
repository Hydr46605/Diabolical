# Applies the standard Diabolical balance profile without operator feedback.
scoreboard players set #profile diab.config 1
data merge storage diabolical:config {profile:"default",profile_id:1}
data merge storage diabolical:events {diabolical_night:{duration_ticks:900,reward_debt_payment:4,cooldown_ticks:6000,target_debt_min:8,target_sin_min:25,trigger:"red_ledger_minor"},debt_collector:{duration_ticks:1200,reward_debt_payment:8,cooldown_ticks:6000,target_debt_min:50,severe_debt_min:100,trigger:"severe_debt"},director:{audit_cooldown_ticks:2400,audit_debt_min:120,audit_sin_min:90,backlash_cooldown_ticks:200}}
data merge storage diabolical:mobs {thresholds:{imp_sin_min:25,wraith_sin_min:75,bailiff_debt_min:35,bailiff_sin_min:25,accuser_sin_min:150},cooldowns:{imp:600,wraith:1200,bailiff:3000,advocate:1800,accuser:6000},rewards:{imp_debt_payment:1,wraith_sin_payment:3,bailiff_debt_payment:5,bailiff_sin_payment:2,advocate_sin_payment:4,accuser_sin_payment:25,accuser_debt_payment:12}}
function diabolical:config/profile/sync_scores
