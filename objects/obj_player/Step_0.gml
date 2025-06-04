
// === Handle Movement ===
// Horizontal movement
var h_input = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var h_pixel = sign(h_input);

if (place_meeting(x + h_input * move_speed, y, obj_collision)) {
    while (!place_meeting(x + h_pixel, y, obj_collision)) {
        x += h_pixel;
    }
} else {
    x += h_input * move_speed;
}

// Vertical movement
var v_input = keyboard_check(ord("S")) - keyboard_check(ord("W"));
var v_pixel = sign(v_input);

if (place_meeting(x, y + v_input * move_speed, obj_collision)) {
    while (!place_meeting(x, y + v_pixel, obj_collision)) {
        y += v_pixel;
    }
} else {
    y += v_input * move_speed;
	
}


// === Update facing direction ===
if (h_input != 0 || v_input != 0) {
    if (abs(h_input) > abs(v_input)) {
        facing_direction = (h_input > 0) ? "right" : "left";
    } else {
        facing_direction = (v_input > 0) ? "down" : "up";
    }
}



//handle interact button
if(keyboard_check_pressed(vk_space) && current_state != play_state.busy ){

	if(game.current_phase == phase.serve){
		handle_interaction(facing_direction,x,y);
	}
	//cannot interact when in different phase. Roll instead!

}