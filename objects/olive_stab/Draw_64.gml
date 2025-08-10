


draw_sprite_ext(birds_eye_background,0,display_get_gui_width()/2,display_get_gui_height()/2,3,3,0,c_white,1.0);


scale = 3;
draw_sprite_ext(spr_martini_topdown,0,display_get_gui_width()/2,display_get_gui_height()/2,scale,scale,0,c_white,1);


draw_sprite_ext(spr_floating_olive,0,olive_x,olive_y,1,1,rotate,c_white,1.0)

//changes where we are drawing the skewer
if (can_skewer){
	draw_sprite_ext(spr_skewer, 0, orb_x, orb_y, 1, 1, theta + 270, c_white, 1);
}
else{
	draw_sprite_ext(spr_skewer, 0, sk_x, sk_y, 1, 1, theta + 270, c_white, 1);
}


// Debugging
// draw_circle(cx, cy, radius, true);
// draw_line(cx, cy, orb_x, orb_y);