// Common frame data

//Scaled up due to rendering problems (originally half of next two values)
var frame_width = 44;
var frame_height = 64;

// Animation state
var base_row = animation_state;
var hands_row = hands_animation_state;

// Eventually add timers for frame animation:
var base_frame = (current_time div 600) mod 2; // idle = 2 frames, walk = 4
if (animation_state == BaseAnim.WALK) {
	base_frame = (current_time div 100) mod 4;
}
if (animation_state == BaseAnim.DODGE) {
	base_frame = 0; // Only one frame for now
}

var hands_frame = (hands_animation_state == HandAnim.WALK) ? (current_time div 100) mod 2 : 0;


// Calculate base sprite position
var base_x = base_frame * frame_width;
var base_y = base_row * frame_height;

// Calculate hands sprite position
var hands_x = hands_frame * frame_width;
var hands_y = hands_row * frame_height;


// Half size for scaling
var scale = 0.5;
var flip = sprite_dir; // Should already be -1 for left, 1 for right

// Adjust draw position to simulate bottom-center origin
var draw_x = x - (frame_width * scale * 0.5);  // center horizontally
var draw_y = y - (frame_height * scale);       // align to bottom

// If flipped, nudge x to account for mirrored drawing
if (flip == -1) {
    draw_x += frame_width * scale;
}

draw_sprite_part_ext(
    spr_player_base,
    0,
    base_x,
    base_y,
    frame_width,
    frame_height,
    draw_x,
    draw_y,
    scale * flip,
    scale,
    c_white,
    1
);

#region rendering hands
switch (game.current_phase){


	case phase.last_call:
		
		var center_x = x;
		var center_y = y - (frame_height/4);       // align to bottom

		// Step 1: Get aiming angle from player to mouse
		var mx = device_mouse_x(0);
		var my = device_mouse_y(0);
		var aim_angle = point_direction(center_x, center_y, mx, my); // in degrees

		// Step 2: Choose the distance from the player (radius of the ring)
		var gun_radius = 16; // You can tweak this — 16 to 24 looks good usually

		// Step 3: Calculate gun position on the ring
		var gun_x = center_x + lengthdir_x(gun_radius, aim_angle);
		var gun_y = center_y + lengthdir_y(gun_radius, aim_angle);

		// Step 4: Choose the gun sprite and scale
		var gun_sprite = weapon.sprite;
		var gun_frame = 1;
		var scale = weapon.scale;

		// Step 5: Draw gun at that point, rotated to aim
		draw_sprite_ext(
		    gun_sprite,
		    gun_frame,
		    gun_x,
		    gun_y,
		    scale,
		    scale*sprite_dir,
		    aim_angle,
		    c_white,
		    1
		);
	
	break;
	default:
		// Draw the hands at half size
		draw_sprite_part_ext(
			spr_player_hands,
			0,
			hands_x,
			hands_y, 
			frame_width,
			frame_height,
		    draw_x,
		    draw_y,
		    scale * flip,
		    scale,
			c_white, 
			1
		);
}
#endregion

//for debugging
//draw_circle_color(center_x, center_y, gun_radius, c_lime, c_lime, true);
//draw_line(center_x, center_y, mx, my);

