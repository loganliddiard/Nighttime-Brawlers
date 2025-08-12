// Create
drink_reward   = "Rum and Cola";
amount_awarded = 0;

result = "Lost";
timer  = 6;

ice_cubes_caught = 0;


// Virtual canvas
vw = 320;
vh = 180;

// Cup
cup_x = vw * 0.5;
cup_y = vh - 22;
cup_w = 48;  // cup width in virtual pixels
cup_h = 18;
cup_speed = 3.5;

// Ice
ice_cubes = [];     // array of [x, y]
ice_r = 1;          // visual half-size
ice_speed = 1.8;

// Spawning
spawn_timer = 0;
spawn_interval = game_get_speed(gamespeed_fps) / 2;


cubes_caught = 0;


alarm[0] = game_get_speed(gamespeed_fps) * timer;



