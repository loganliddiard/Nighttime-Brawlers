var s = 3;

// 1) Background (like your example)
draw_sprite_ext(background, 0,
    display_get_gui_width() * 0.5,
    display_get_gui_height() * 0.5,
    s, s, 0, 
	c_white, 1);

// 2) Draw game elements in GUI using scaled virtual coords
// Cup
var c_w =  display_get_gui_width() * 0.25;
var c_h = display_get_gui_height() * 0.25;
var cx = (cup_x * s)+c_w ;
var cy = (cup_y * s)+ c_h;
var cw = (cup_w * 0.5) * s;
var ch = (cup_h * 0.5) * s;

draw_set_color(c_white);

switch(cubes_caught){

	case 0:
		draw_sprite_ext(spr_cola_n_rum,0,cx,cy,2,2,0,c_white,1);
	break;
	
	case 1:
		draw_sprite_ext(spr_cola_n_rum,1,cx,cy,2,2,0,c_white,1);
	break;
	case 2:
		draw_sprite_ext(spr_cola_n_rum,2,cx,cy,2,2,0,c_white,1);
	break;
	
	default:
		draw_sprite_ext(spr_cola_n_rum,3,cx,cy,2,2,0,c_white,1);
	break;
}


// Ice cubes
for (var i = 0; i < array_length(ice_cubes); i++) {
    var ix = (s*ice_cubes[i][0]) + c_w;
    var iy = (s*ice_cubes[i][1]) + c_h;
    var ir = ice_r * s;
    draw_sprite_ext(spr_ice_cube,0,ix,iy,1,1,0,c_white,1);
}

