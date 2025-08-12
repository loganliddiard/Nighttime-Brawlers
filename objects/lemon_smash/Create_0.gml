// Create
drink_reward   = "Lemon Drop";
amount_awarded = 3;

result = "Lost";
timer  = 5;


lemon_stage = 0;

target_button_press = random_range(20,35);
presses = 0;

alarm[0] = game_get_speed(gamespeed_fps) * timer;
