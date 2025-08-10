// Create
drink_reward   = "Martini";
amount_awarded = 0;

result = "Lost";
timer  = 5;

olive_x = display_get_gui_width()/2;
olive_y = display_get_gui_height()/2;

pick_x = display_get_gui_width()/2;
pick_y = display_get_gui_height()/2;

olive_speed = 1;
olive_r = 16;
olive_skewed = false;

can_skewer = true;
skewer_speed = 2;

cx = display_get_gui_width()/2;          // center x
cy = display_get_gui_height()/2;          // center y
radius = 160;     // orbit radius
theta  = 0;      // current angle (degrees)
omega  = 2;      // angular speed (deg/step)
spr_pick = spr_skewer; // 

orb_x = cx + lengthdir_x(radius, theta);
orb_y = cy + lengthdir_y(radius, theta);

dir = irandom_range(0, 359);

rotate = irandom_range(0, 359);
sk_x = orb_x;
sk_y = orb_y;
home_x = -1;
home_y = -1;
stab_phase = 0;
stab_spd = 10;
stab_dir = -1;

alarm[0] = game_get_speed(gamespeed_fps) * timer;
