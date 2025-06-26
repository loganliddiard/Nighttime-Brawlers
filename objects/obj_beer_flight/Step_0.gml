if(game.current_phase != phase.last_call){

	instance_destroy(self);
}
if(enemy_health <= 0){

	instance_destroy(self);
}

// Step Event
if (is_fleeing) {

    if (point_distance(x, y, target_x, target_y) < 8) {
        path_end();
        instance_destroy();
    }
    return;
}
behavior_function();
