
//from to swap
switch(current_phase){
	case(phase.transition):
	current_phase = phase.serve;
	alarm[1] = game_get_speed(gamespeed_fps) * serve_time;
	
	
	break;
	case(phase.serve):
	
	current_phase = phase.last_call;
	alarm[1] = game_get_speed(gamespeed_fps) * last_call_time;
	
	
	break;
	
	case(phase.last_call):
	current_phase = phase.upkeep;
	alarm[1] = game_get_speed(gamespeed_fps) * transition_time;
	
	break;
	
	case(phase.upkeep):
	current_phase = phase.shop;
	
	break;

}