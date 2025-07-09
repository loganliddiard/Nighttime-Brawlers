
draw_set_font(fnt_basic);






draw_text(60,140,string(earned_money)+"$");
draw_text(60,340,string(total_money)+"$");


//from to swap
switch(current_phase){
	case(phase.transition):
	
	draw_text(60,220,"Transitional Phase");
	
	break;
	case(phase.serve):
	var buff = 30;
	draw_text(60,220,"Serving Phase");
	draw_text(60,20,"Hands:");
	for(var i = 0; i < array_length(obj_player.hands);i++){
		
		
		var img = get_menu_item(obj_player.hands[i]);
		if (img!= -1) draw_sprite_ext(img.icon,0,60+(i*buff*2),120,2,2,0,c_white,1);
	}
	
	break;
	
	case(phase.last_call):
	draw_text(60,220,"Last Call Phase");
	
	if (instance_exists(obj_player)) {
	    draw_text(60,180,obj_player.current_state);
	    draw_text(60,20,"Health:");

	    var flip = 1;
	    var buff = 45;
	    var adjust = false;
	    var i = 0;

	    repeat(obj_player.player_hp) {
	        flip *= -1; // flip BEFORE drawing
	        draw_sprite_ext(spr_heart, 0, 60 + (floor(i / 2) * buff * 2) + (adjust * 20 * 2), 120, flip * 2, 2, 0, c_white, 1);

	        adjust = !adjust;
	        i++;
	    }
	}
		break;

	}

draw_text(60,400,"Day - "+string(day));

switch(current_phase){

case(phase.upkeep):
	// UI constants
	var bg_width  = 250;
	var bg_height = 60;
	var alpha     = 0.6;

	// Get center of the screen
	var mid_x = display_get_gui_width() * 0.5;
	var mid_y = 80; // top center of screen, adjust as needed

	// Draw semi-transparent background
	draw_set_alpha(alpha);
	draw_set_color(make_color_rgb(0, 0, 0)); // black
	draw_roundrect(mid_x - bg_width * 0.5, mid_y - bg_height * 0.5,
	                mid_x + bg_width * 0.5, mid_y + bg_height * 0.5,
	                false); // no outline
	draw_set_alpha(1); // reset alpha

	// Draw money text
	var money_text = "+ $" + string(earned_money);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_text(mid_x, mid_y, money_text);
	
		// Draw money text
	var money_text = "$" + string(total_money);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_text(mid_x, mid_y+40, money_text);
break;
}