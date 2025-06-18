
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
	
	//check if rent is due
	if(day % 3 == 0){
	
		if(money >= rent_amount){
				money -= rent_amount;
				rent_amount *= 2; // double rent amount for next week
		} else{
			
			room = rm_gameover;
		
		}
	
	}
	current_phase = phase.shop;
	
	break;

}