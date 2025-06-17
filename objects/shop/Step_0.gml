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
    
    if (game.money >= itm.price) {
        game.money -= itm.price;
        itm.onBuy(); // run the item's effect
        
        
        // Optional: remove or grey out item
        items[hover_item] = undefined; // or mark as bought
    } 
}


if (mouse_check_button_pressed(mb_left)) {
    if (hover_reroll) {
        // reroll logic
		show_message("reroll items clicked");
    } else if (hover_swap_merchant) {
        // reroll merchant
		show_message("reroll merchant clicked");
    } else if (hover_exit) {
        // confirm logic
		show_message("Go to next day clicked");
    }
}