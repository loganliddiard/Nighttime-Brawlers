if(game.current_phase != phase.last_call){

	instance_destroy(self);
}

if(enemy_health <= 0){

	instance_destroy(self);
}

behavior_function();
