
if(game.current_phase == phase.serve){
	
	spawn_timer = random_range(3,8);
	
	var cust_count = irandom_range(1, 4);
	
	repeat(cust_count){
		show_debug_message(free_seats);
		if(free_seats > 0){
			show_debug_message("spawning customer...");
			instance_create_layer(x, y+36, "Instances", obj_customer);
			free_seats -=1;
		} 
	}
}

alarm[0] = game_get_speed(gamespeed_fps) * spawn_timer;