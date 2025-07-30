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