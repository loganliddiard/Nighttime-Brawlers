event_inherited();

behavior_function = ricochet_run_gun;

enemy_health = 12;
fire_cooldown = irandom_range(60, 120);
move_cooldown = irandom_range(60, 120);

spr_sheet = spr_beer_gunner_sheet;     // your spritesheet resource
frame_w   = 32;            // << set your actual frame size
frame_h   = 48;            // << set your actual frame size

enemy_health = 10;

// Pick an initial heading between 190°–350° (mostly downward)
dir = irandom_range(190, 350); //needs dir since we run in a random direction

