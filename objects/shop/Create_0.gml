item_slots = 3;
max_item_slots = 5;

reroll_cost = 50;
reroll_default_cost = 50;

hover_item = -1;
hover_reroll  = false;
hover_exit    = false;
hover_swap_merchant = false;

merchants = ["Vendor",
			"Arms Dealer",
			"Boot Legger"]
			
current_vendor = merchants[0]; //always start with vendor

items = [];  // array of structs
visible_slots = 3 + obj_player.extra_shop_slots;


hide_items = false;


//UI variables

// Get display dimensions
scr_w = display_get_gui_width();
scr_h = display_get_gui_height();

// Define shop window size
win_w = scr_w / 2;
win_h = scr_h / 2; 

win_x = (scr_w / 2) - (win_w / 2);
win_y = scr_h / 2 - win_h / 2;

slots = 3;
slot_w = win_w / 6; // room for spacing
slot_h = slot_w ; // taller than wide, card-like
gap = (win_w - slot_w * slots) / (slots + 1);
start_x = win_x + gap;
y_loc = win_y + (win_h/2) + slot_h/2;

//button variables

btn_scale = 2;
btn_w = 96 * btn_scale;
btn_h = 96 * btn_scale;
	
right_btn_x = win_x + win_w + 20;
right_btn_y = win_y + win_h / 2 - btn_h / 2;
	

text_buffer = string_height("ABCDEFGHIJKLMNOPQRSTUVWXYZ")+8;

left_btn_x = win_x - btn_w - 20; // 20px gap from shop window
top_btn_y = win_y + win_h / 2 - btn_h;
bottom_btn_y = top_btn_y + btn_h + 10; // 10px vertical spacing
global.shop_pool = noone;
function populate_shop() {
    if (global.shop_pool != noone) {
        items = []; // clear old items

        var shuffled_pool = array_shuffle(global.shop_pool); // built-in in recent GMS2+
        var max_items = min(visible_slots, array_length(shuffled_pool));

        for (var i = 0; i < max_items; ++i) {
            array_push(items, shuffled_pool[i]);
        }
    }
}


