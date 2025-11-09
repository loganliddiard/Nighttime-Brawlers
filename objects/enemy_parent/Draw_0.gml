// Destination anchor (bottom-center at x,y)
var dest_x = x;
var dest_y = y;

// choose row by state
var row = state;

// source rect in the spritesheet
var src_x = anim_frame * frame_w;
var src_y = row * frame_h;

// compute top-left draw position from bottom-center anchor
// (because draw_sprite_part_ext draws at top-left)
var draw_x = dest_x - frame_w * 0.5;
var draw_y = dest_y - frame_h;

// flipping: draw_sprite_part_ext flips around the draw point,
// so when face == -1 we need to shift by frame_w
var xscale = face;
if (xscale < 0) draw_x += frame_w;

// finally draw the slice
draw_sprite_part_ext(
    spr_sheet, 0,
    src_x, src_y, frame_w, frame_h,
    draw_x, draw_y,
    xscale, 1,
    c_white, 1
);

// OPTIONAL: draw weapons row (row 4) as a separate overlay sprite
// draw_sprite_ext(spr_enemy_weapon, image_index, draw_x + something, draw_y + something, xscale, 1, 0, c_white, 1);
