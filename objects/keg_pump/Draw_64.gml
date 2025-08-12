draw_sprite_ext(back_of_bar_background,0,display_get_gui_width()/2,display_get_gui_height()/2,3,3,0,c_white,1.0);

var scale = 3;


//do calculations for status bar
var status_x1 = (display_get_gui_width()/2) - (sprite_get_height(back_of_bar_background)*scale/2);
var width = status_x1 + (status_bar_width * scale);
var status_y1 = (display_get_gui_height()/2) + (sprite_get_height(back_of_bar_background)*scale/3);
var max_height = status_y1 - (max_pressure * scale);

draw_set_color(c_red);
//render status bar
draw_rectangle(status_x1,status_y1,width,max_height,false);

draw_set_color(c_green);


draw_rectangle(status_x1,status_y1-((target-buffer)*3),width,status_y1-((target+buffer)*3),false);

draw_set_alpha(.6);
draw_set_color(c_yellow);

var pressure_height = status_y1 - (pressure * scale);
draw_rectangle(status_x1,status_y1,width,pressure_height,false);
draw_set_alpha(1);


// render status pin

var pin_x = (display_get_gui_width()/2) + (sprite_get_height(back_of_bar_background)*scale/2);
var pin_y = (display_get_gui_height()/2);

draw_sprite_ext(pump_status,status,pin_x,pin_y,scale,scale,0,c_white,1);

draw_set_color(c_white);
//calculate asset locations
var keg_x = (display_get_gui_width()/2)
var keg_y = (display_get_gui_height()/2) + (sprite_get_height(back_of_bar_background)*scale/4);

var pump_x = keg_x;
var pump_y = keg_y - ( sprite_get_height(keg)*scale/2) - (((sprite_get_height(pump) / 2)+pump_down*scale));

//render assets
draw_sprite_ext(pump,0,pump_x,pump_y,scale,scale,0,c_white,1);
draw_sprite_ext(keg,0,keg_x,keg_y,scale,scale,0,c_white,1);

