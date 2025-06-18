if(game.current_phase != phase.serve) {
	
	if(!kicked_out){
		kicked_out = true;
		alarm[0] = game_get_speed(gamespeed_fps) *1;	
	}
}

switch (current_state){

case(cust_state.find_seat):

    if (pathing_started) break;

    var nearest_seat = noone;
    var shortest_dist = 99999;

    // Loop through stool instances manually
    for (var i = 0; i < instance_number(obj_stool); i++) {
        var stool = instance_find(obj_stool, i);
        if (!stool.is_taken) {
            var dist = point_distance(x, y, stool.x, stool.y);
            if (dist < shortest_dist) {
                shortest_dist = dist;
                nearest_seat = stool;
            }
        }
    }

    if (nearest_seat != noone) {
        target_seat = nearest_seat;
        seat = nearest_seat;

        // Try to build a path first
        var temp_path = path_add();
        if (mp_grid_path(global.grid, temp_path, x, y, seat.x, seat.y, true)) {
            path = temp_path;
            path_start(path, 2, path_action_stop, false);
            pathing_started = true;
            seat.is_taken = true;
        } else {
            path_delete(temp_path);
        }
    }

    break;
	
	case(cust_state.leaving):
// Find the nearest unoccupied seat
	var nearest_door = noone;
	var shortest_dist = 99999;

	with (obj_door) {
		var dist = point_distance(other.x, other.y, x, y);
	    if (dist < shortest_dist) {
			shortest_dist = dist;
	        nearest_door= id;
	        }
	    }

	if (nearest_door != noone) {
	    target_door = nearest_door;
	    

		seat = target_seat;

	    // Use GameMaker's built-in pathfinding
	    path = path_add();
	    mp_grid_path(global.grid, path, x, y, target_door.x, target_door.y, true);
	    path_start(path, 2, path_action_stop, false); // Speed 2, don't repeat
	}
	
	if (path_index == -1 && !pathing_complete) {
		instance_destroy(self);

   
}
	break;

}

if (pathing_started && !pathing_complete) {
    if (path_index == -1) {
        pathing_complete = true;
        path_end();

        current_state = cust_state.ordering;

        x = seat.x;
        y = seat.y + 32;
    }
}