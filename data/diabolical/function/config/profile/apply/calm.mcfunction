# Applies a calmer server profile without operator feedback.
scoreboard players set #profile diab.config 0
data merge storage diabolical:config {profile:"calm",profile_id:0}
data merge storage diabolical:events {diabolical_night:{duration_ticks:700,reward_debt_payment:5,cooldown_ticks:9000,target_debt_min:14,target_sin_min:40,trigger:"red_ledger_minor"},debt_collector:{duration_ticks:1000,reward_debt_payment:10,cooldown_ticks:9000,target_debt_min:70,severe_debt_min:130,trigger:"severe_debt"},director:{audit_cooldown_ticks:3600,audit_debt_min:180,audit_sin_min:140,backlash_cooldown_ticks:300}}
data merge storage diabolical:mobs {thresholds:{imp_sin_min:45,wraith_sin_min:110,bailiff_debt_min:50,bailiff_sin_min:45,accuser_sin_min:220},cooldowns:{imp:1200,wraith:2400,bailiff:4800,advocate:3000,accuser:9000},rewards:{imp_debt_payment:2,wraith_sin_payment:4,bailiff_debt_payment:7,bailiff_sin_payment:3,advocate_sin_payment:5,accuser_sin_payment:30,accuser_debt_payment:15}}
function diabolical:config/profile/sync_scores
