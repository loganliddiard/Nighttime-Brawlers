

switch (current_state){

	case(cust_state.find_seat):
	// Find the nearest unoccupied seat
	var nearest_seat = noone;
	var shortest_dist = 99999;

	with (obj_stool) {
	    if (!is_taken) {
			
	        
			
			
			var dist = point_distance(other.x, other.y, x, y);
	        if (dist < shortest_dist) {
	            shortest_dist = dist;
	            nearest_seat = id;
	        }
	    }
	}

	if (nearest_seat != noone) {
	    target_seat = nearest_seat;
	    target_seat.is_taken = true;

		seat = target_seat;

	    // Use GameMaker's built-in pathfinding
	    path = path_add();
	    mp_grid_path(global.grid, path, x, y, target_seat.x, target_seat.y, true);
	    path_start(path, 2, path_action_stop, false); // Speed 2, don't repeat
	}
	
	if (path_index == -1 && !pathing_complete) {
    pathing_complete = true;


    current_state = cust_state.ordering;

    // Snap to exact seat position if needed
    x = target_seat.x;
    y = target_seat.y+32;
	
	show_message("Snap")

   
}
	
	break;

}