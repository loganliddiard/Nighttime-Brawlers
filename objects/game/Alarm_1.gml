
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
	
	
	var passive_total = 0;
	var total = instance_number(obj_passive_income);
	if (total > 0) {
	
		for(var i = 0;i < total; i++){
			var selected_slot = instance_find(obj_passive_income, i);
		
			passive_total += selected_slot.passive_base * bar_stars;
			
			
		}
	}
	
	
	
	
	
	
	total_money += earned_money;
	total_money += tip_money;
	tip_money = 0;
	earned_money = 0;
	break;
	
	case(phase.upkeep):
	if(player_died){
		player_died = false;
		obj_player.player_hp = obj_player.max_health;
	}	
	

	
	
	
	//check if rent is due
	if(day % 3 == 0){
	
		if(total_money >= rent_amount){
				total_money -= rent_amount;
				rent_amount *= 2; // double rent amount for next week
		} else{
			
			room = rm_gameover;
		
		}
	
	}
	current_phase = phase.shop;
	
	break;

}