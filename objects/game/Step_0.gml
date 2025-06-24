
if(current_phase == phase.last_call){

	if(obj_player.player_hp <= 0 && !player_died){
		player_died = true;
		obj_player.current_state = play_state.busy;
		earned_money = floor(earned_money / 2);
		current_state = phase.upkeep;
		alarm[1] = game_get_speed(gamespeed_fps) * transition_time;
	
		
	}	
	
}
