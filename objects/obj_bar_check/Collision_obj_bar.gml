

with(obj_player){

	
	//clamp player to bar
	if (place_meeting(x, y - move_speed, obj_bar)) {
	current_state = play_state.behind_bar;
	while (!place_meeting(x, y - 1, obj_collision)) {
		        y -= 1;
		    }
		} else {
		    y -= move_speed;
	}


}