

if (game.current_phase == phase.shop){

	// Draw GUI Event of obj_shop_controller

	// Draw a semi-transparent dark overlay over the full screen
	draw_set_alpha(0.6);
	draw_set_color(c_black);
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
	draw_set_alpha(1);
	


	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	// Optional: draw a rounded translucent background
	draw_set_color(make_color_rgb(30, 30, 30));  // dark gray
	draw_set_alpha(0.9);
	draw_roundrect(win_x, win_y, win_x + win_w, win_y + win_h, false); // border only = false
	draw_set_alpha(1);

	// Optional: add a white border
	draw_set_color(c_white);
	draw_roundrect(win_x, win_y, win_x + win_w, win_y + win_h, true);
	

	for (var i = 0; i < slots; ++i) {
	    var x_loc = start_x + i * (slot_w + gap);
	    draw_set_color(c_white);
	    draw_rectangle(x_loc, y_loc, x_loc + slot_w, y_loc + slot_h, false); // empty slot outlines
	}



	// ReRoll Button
	draw_set_color(make_color_rgb(50, 50, 50));
	draw_set_alpha(0.9);
	draw_roundrect(left_btn_x, top_btn_y, left_btn_x + btn_w, top_btn_y + btn_h, false);
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_roundrect(left_btn_x, top_btn_y, left_btn_x + btn_w, top_btn_y + btn_h, true);
	draw_text_ext(left_btn_x + 10, top_btn_y + 10, "Reroll\n"+"$"+string(reroll_cost),text_buffer,btn_w-20);

	// Swap merhcant Button
	draw_set_color(make_color_rgb(50, 50, 50));
	draw_set_alpha(0.9);
	draw_roundrect(left_btn_x, bottom_btn_y, left_btn_x + btn_w, bottom_btn_y + btn_h, false);
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_roundrect(left_btn_x, bottom_btn_y, left_btn_x + btn_w, bottom_btn_y + btn_h, true);
	draw_text_ext(left_btn_x + 10, bottom_btn_y + 10, "Swap Merchant",text_buffer,btn_w-20);
	
	// Next day button
	draw_set_color(make_color_rgb(50, 50, 50));
	draw_set_alpha(0.9);
	draw_roundrect(right_btn_x, right_btn_y, right_btn_x + btn_w, right_btn_y + btn_h, false);
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_roundrect(right_btn_x, right_btn_y, right_btn_x + btn_w, right_btn_y + btn_h, true);
	draw_text_ext(right_btn_x + 10, right_btn_y + 10, "Next Day",text_buffer,btn_w-20);
	
	
	//Draw Items
	
	for (var i = 0; i < slots; ++i) {
	    var xx = start_x + i * (slot_w + gap);
	    var yy = y_loc;
    
	    if (i < array_length(items)) {
	        var item = items[i];
        
	        // Background
	        draw_set_color(c_white);
	        draw_rectangle(xx, yy, xx + slot_w, yy + slot_h, false);
        
			if (item != undefined){
	        // Item sprite
	        draw_sprite_ext(item.spr, 0, xx + slot_w/2, (yy + slot_h/2)+32, 2, 2, 0, c_white, 1);
        
	        // Name and Price
	        draw_set_color(c_black);
			
			draw_set_halign(fa_center);
			var cost = ceil(item.price-(item.price*obj_player.shop_discount));
	        draw_text(xx + (slot_w/2), yy + slot_h - 32, "$" + string(cost));
			draw_set_halign(fa_left);
	        // Hover effect
			// Mouse position
			var mx = device_mouse_x_to_gui(0);
			var my = device_mouse_y_to_gui(0);
	        if (mx > x && mx < x + slot_w && my > y && my < y + slot_h) {
		            hover_item = i;
		        }			
			}

	    } else {
	        // Draw empty slot
	        draw_set_color(c_gray);
	        draw_rectangle(x, y, x + slot_w, y + slot_h, false);
	    }
	}
	
	// Description box dimensions (same width as shop window)
	var desc_h = win_h * 0.25;
	var desc_y = win_y + win_h + 20;  // some padding below shop window

	draw_set_color(make_color_rgb(20, 20, 20));  // even darker gray
	draw_set_alpha(0.9);
	draw_roundrect(win_x, desc_y, win_x + win_w, desc_y + desc_h, false);
	draw_set_alpha(1);

	// Optional: outline
	draw_set_color(c_white);
	draw_roundrect(win_x, desc_y, win_x + win_w, desc_y + desc_h, true);
	
	if (hover_item != -1 && hover_item < array_length(items)) {
	    var item = items[hover_item];
		if (item != undefined) {
			draw_set_color(c_white);
			draw_text_ext(win_x + 16, desc_y + 16,item.name+" - "+ item.description,text_buffer,win_w-16);
		}

	} else {
	draw_set_color(c_white);
	    draw_text(win_x + 16, desc_y + 16, "What can I do for you?");
		}

}