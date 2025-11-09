event_inherited();


behavior_function = berserker_behavior;

enemy_health = 15;          // tweak to taste
move_speed   = 3;           // constant rush speed

cooldown = false;
hit_cooldown_timer = 1.5;
dir = 0;

move_cooldown = irandom_range(60, 120);
spr_sheet = spr_beer_brawler_sheet;     // your spritesheet resource
slide_mode = false;   // true while it’s sliding along the bar
slide_dir  = 0;       // cached direction to keep while sliding

