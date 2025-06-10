

with(other){

	hide_order = false;
	
	if(current_state == cust_state.ordering){
		current_state = cust_state.waiting;
		
	}
	else if(current_state == cust_state.waiting){
		
		
		if(check_for_drinks(requested_drink.name,requested_drink.price)){
		
			current_state = cust_state.idle;
			alarm[0] = game_get_speed(gamespeed_fps) * idle_time;
			
		}
	
	
	}
	
}


instance_destroy(self);