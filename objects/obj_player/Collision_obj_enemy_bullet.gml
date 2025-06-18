
if(!hit_cooldown && !invincible && current_state != play_state.dodge){
	player_hp -= 1;
	hit_cooldown = true;
	alarm[2] = game_get_speed(gamespeed_fps) * hit_cooldown_timer;
}
