#region Roll
if(current_state == play_state.dodge){
    if (!place_meeting(x + roll_dx, y, obj_collision)) {
        x += roll_dx;
    }
    if (!place_meeting(x, y + roll_dy, obj_collision)) {
        y += roll_dy;
    }
}
#endregion

#region Knockback
if (knockback_timer > 0) {
    var new_x = x + knockback_dx;
    var new_y = y + knockback_dy;

    if (!place_meeting(new_x, y, obj_wall) && !place_meeting(new_x, y, obj_bar)) {
        x = new_x;
    }
    if (!place_meeting(x, new_y, obj_wall) && !place_meeting(new_x, y, obj_bar)) {
        y = new_y;
    }

    knockback_timer -= 1;

    // Optional: ease out knockback
    knockback_dx *= 0.8;
    knockback_dy *= 0.8;

    exit; // Skip player input for now
}
#endregion

if(current_state == play_state.dodge || current_state == play_state.busy) exit;

#region Movement
// === Handle Movement ===


// Get input first
var h_input = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var v_input = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// Handle walk vs idle
if (current_state == play_state.walk || current_state == play_state.idle) {
	if (h_input != 0 || v_input != 0) {
		current_state = play_state.walk;
	} else {
		current_state = play_state.idle;
	}
}

switch(current_state){
	case play_state.idle:
	case play_state.walk:

		
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
	break;
	
	case(play_state.behind_bar):
		
		
		
		// Horizontal movement
		var h_input = keyboard_check(ord("D")) - keyboard_check(ord("A"));
		var h_pixel = sign(h_input);

		if (place_meeting(x + h_input * bar_move_speed, y, obj_bar_exit)) {
		    while (!place_meeting(x + h_pixel, y, obj_bar_exit)) {
		        x += h_pixel;
		    }
		} else {
		    x += h_input * bar_move_speed;
		}
	break;

}

// Update sprite direction
if (game.current_phase != phase.last_call) {
	
	if(h_input != 0){
		sprite_dir = (h_input > 0) ? 1 : -1;
	}

} else {
	
	var dx = device_mouse_x(0) - x;
	sprite_dir = (dx >= 0) ? 1 : -1;
}

#endregion

#region Actions
//handle interact button / roll / 
if(keyboard_check_pressed(vk_space) && current_state != play_state.busy ){

	if(game.current_phase == phase.serve){
		handle_interaction(facing_direction,x,y);
	}
	else if (game.current_phase == phase.last_call){
		
		switch(current_state){
		
			case play_state.behind_bar:
			
				current_state = play_state.idle;
			
			break;
			
			default:
			if(can_roll){
				can_roll = false;
				current_state = play_state.dodge;
				alarm[0] = game_get_speed(gamespeed_fps) * roll_time;

				// Set roll direction based on current input or facing
				var h_input = keyboard_check(ord("D")) - keyboard_check(ord("A"));
				var v_input = keyboard_check(ord("S")) - keyboard_check(ord("W"));

				// Normalize diagonal movement
				var roll_mag = point_distance(0, 0, h_input, v_input);
				if (roll_mag > 0) {
				    roll_dx = (h_input / roll_mag) * roll_speed;
				    roll_dy = (v_input / roll_mag) * roll_speed;
				} else {
				    // If no input, roll in current facing direction
				    switch (facing_direction) {
				        case "up": roll_dx = 0; roll_dy = -roll_speed; break;
				        case "down": roll_dx = 0; roll_dy = roll_speed; break;
				        case "left": roll_dx = -roll_speed; roll_dy = 0; break;
				        case "right": roll_dx = roll_speed; roll_dy = 0; break;
				    }
				}			
			}
			

			
		}

	
	}
	//cannot interact when in different phase. Roll instead!

}

//drops drinks in hand
if(keyboard_check_pressed(ord("Q"))){
	for(var i = 0; i < array_length(hands);i++){
		
		hands[i] = -1
	}
}

//handle 

//shoot
if(weapon.is_auto){
	if(mouse_check_button(mb_left) && can_fire){

		if(game.current_phase == phase.last_call && (current_state != play_state.ducking && current_state != play_state.dodge)){
	
			weapon.fire_function(self);
			can_fire = false;
			alarm[3] = game_get_speed(gamespeed_fps) * weapon.cooldown;
		
		}

	}

}
else{
	if(mouse_check_button_pressed(mb_left) && can_fire){

		if(game.current_phase == phase.last_call && (current_state != play_state.ducking && current_state != play_state.dodge)){
	
			weapon.fire_function(self);
			can_fire = false;
						can_fire = false;
			alarm[3] = game_get_speed(gamespeed_fps) * weapon.cooldown;
		
		}

	}
}


// === Duck Behind Bar ===
switch(current_state) {

    case play_state.behind_bar:
        if (mouse_check_button(mb_right)) {
            current_state = play_state.ducking;
            invincible = true;
        }
        break;

    case play_state.ducking:
        if (!mouse_check_button(mb_right)) {
            current_state = play_state.behind_bar;
            invincible = false;
        }
        break;

    default:
        // Not behind bar or ducking — check if we pushed button to clamp to bar
		if (mouse_check_button_pressed(mb_right) && game.current_phase != phase.serve) {
			instance_create_layer(x,y-game.cs,"instances",obj_bar_check);
        }
        invincible = false; // safety check
        break;
}

#endregion

#region Update Animation State

// Base body animation
switch(current_state) {
	case play_state.dodge:
		animation_state = BaseAnim.DODGE;
		break;

	case play_state.walk:
		animation_state = BaseAnim.WALK;
		break;

	case play_state.behind_bar:
	case play_state.idle:
	default:
		animation_state = BaseAnim.IDLE;
		break;
}

// Hands animation
var has_gun = (weapon != noone); // Replace with your actual condition
var has_drink = false;
for (var i = 0; i < array_length(hands); i++) {
	if (hands[i] != -1) {
		has_drink = true;
		break;
	}
}

if (has_gun && game.current_phase == phase.last_call) {
	hands_animation_state = HandAnim.GUN_BASE; // Expand this to point to weapon ID offset later
}
else if (has_drink) {
	hands_animation_state = HandAnim.DRINK;
}
else if (current_state == play_state.walk) {
	hands_animation_state = HandAnim.WALK;
}
else {
	hands_animation_state = HandAnim.IDLE;
}

#endregion
