
if(game.current_phase != phase.shop) exit;

// Reset hover states
hover_reroll  = false;
hover_exit    = false;
hover_swap_merchant = false;

// Mouse position
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Reroll button (top left)
if (mx > left_btn_x && mx < left_btn_x + btn_w &&
    my > top_btn_y && my < top_btn_y + btn_h) {
    hover_reroll = true;
}

// Exit button (Swap Merchant left)
if (mx > left_btn_x && mx < left_btn_x + btn_w &&
    my > bottom_btn_y && my < bottom_btn_y + btn_h) {
    hover_swap_merchant = true;
}

// Confirm button (right)
if (mx > right_btn_x && mx < right_btn_x + btn_w &&
    my > right_btn_y && my < right_btn_y + btn_h) {
    hover_exit = true;
}


hover_item = -1;  // reset

// Detect hovered item again (same loop as above)
for (var i = 0; i < array_length(items); ++i) {
    var xx = start_x + i * (slot_w + gap);
    var yy = y_loc;

    if (mx > xx && mx < xx + slot_w && my > yy && my < yy+ slot_h) {
        hover_item = i;
    }
}

// Handle click to buy
if (hover_item != -1 && mouse_check_button_pressed(mb_left)) {
    var itm = items[hover_item];
    
	
	if (itm!= undefined){	
		var cost = itm.price-(ceil(obj_player.shop_discount*itm.price))
		if (game.total_money >= cost){
	        game.total_money -= cost;
	        itm.onBuy(); // run the item's effect
        
        
	        // Optional: remove or grey out item
	        items[hover_item] = undefined; // or mark as bought
	    } 
	}
}


if (mouse_check_button_pressed(mb_left)) {
    if (hover_reroll) {
        // reroll logic
		if(game.total_money >= reroll_cost){
			game.total_money -= reroll_cost;
			reroll_cost += 5;
			populate_shop();	
		}
		
    } else if (hover_swap_merchant) {
        // reroll merchant
		show_message("reroll merchant clicked. Not implemented yet");
    } else if (hover_exit) {
        // Go to next day logic
		reroll_cost = reroll_default_cost; //ensure that reroll doesn't keep going up
		game.day +=1;
		game.earned_money = 0;
		populate_shop();
		game.current_phase = phase.transition;
		game.alarm[1] = game_get_speed(gamespeed_fps) * game.transition_time;
		obj_player.current_state = play_state.idle;
	}
}