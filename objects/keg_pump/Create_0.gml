// Create
drink_reward   = "Amber Ale";
amount_awarded = 0;

result = "Lost";
timer  = 7;

over_poured = false;

pressure = 0;
max_pressure = 100;

status_bar_width = 20;
target = random_range(50,75);
buffer = random_range(7,17);

pressure_loss_rate = .5;
pump_up_rate = 2;


max_pump_down = 12;
pump_down = max_pump_down;


status = 0 // 0 means bad, 1 means good;


alarm[0] = game_get_speed(gamespeed_fps) * timer;



