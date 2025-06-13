if(game.current_phase == phase.last_call && !instance_exists(obj_customer)){
	
	if(!pause_spawn){
	pause_spawn = true;
		
	var total = instance_number(obj_windows);

	if (total > 0) {
	    var random_index = irandom(total - 1);
	    var selected_window = instance_find(obj_windows, random_index);
		
		var random_enemy = spawnable_enemies[irandom(array_length(spawnable_enemies) - 1)];
	
		
		selected_window.spawn_enemy(random_enemy);
	}
		alarm[0] = game_get_speed(gamespeed_fps) * spawn_timer;
	}
	
	
}