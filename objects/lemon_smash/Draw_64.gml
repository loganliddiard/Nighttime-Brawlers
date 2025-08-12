draw_sprite_ext(background,0,display_get_gui_width()/2,display_get_gui_height()/2,3,3,0,c_white,1.0);


scale = 3;
draw_sprite_ext(spr_lemon,lemon_stage,display_get_gui_width()/2,display_get_gui_height()/2,scale,scale,0,c_white,1);



var glass_x = display_get_gui_width()/2
var glass_y = ((display_get_gui_height()/2) +((sprite_get_height(background) * scale)/2)) - ( sprite_get_height(spr_lemon_drop_glass)*scale/2)

switch(lemon_stage){
	case 0:
	case 1:
	
	draw_sprite_ext(spr_lemon_drop_glass,0,glass_x,glass_y,scale,scale,0,c_white,1);
	break;
	case 2:
	case 3:
	draw_sprite_ext(spr_lemon_drop_glass,1,glass_x,glass_y,scale,scale,0,c_white,1);
	default:
	draw_sprite_ext(spr_lemon_drop_glass,2,glass_x,glass_y,scale,scale,0,c_white,1);

}
