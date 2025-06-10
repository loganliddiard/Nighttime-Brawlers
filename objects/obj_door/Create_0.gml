
spawn_timer = random_range(1,3);

free_seats = instance_number(obj_stool);

alarm[0] = game_get_speed(gamespeed_fps) * spawn_timer;