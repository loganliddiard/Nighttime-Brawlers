// Create
drink_reward   = "Beer";
amount_awarded = 0;

result = "Lost";
timer  = 5;

over_poured = false;

target = random_range(90,110);
buffer = 10;
poured = 0;
foam = 0;

display_poured = 0; // for smooth animation

alarm[0] = game_get_speed(gamespeed_fps) * timer;

pour_liquid_per_step = random_range(.35,1);     // liquid added each step while holding
foam_build_per_step  = random_range(1.5,3);   // foam added each step while holding
foam_settle_rate     = random_range(1,3);     // foam units that try to settle per step when not pouring
foam_settle_yield    = 0.5;   // 0..1: how much of settled foam becomes liquid (rest dissipates)
foam_visual_gain     = 0.6;   // how much foam adds to the displayed height (visual head)
foam_cap             = 200;   // optional max foam cap

// Visual smoothing
display_liquid = 0;
display_foam   = 0;
smooth_k       = 0.25;        // lerp factor for visuals