//resets player after a roll is perfomed

current_state = play_state.idle;
roll_dx = 0;
roll_dy = 0;
invincible = false;

alarm[1] = game_get_speed(gamespeed_fps) * roll_cooldown_time;