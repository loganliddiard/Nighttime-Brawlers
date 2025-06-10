


enum cust_state {

	find_seat,
	ordering,
	waiting,
	idle,
	leaving,


}

current_state = cust_state.find_seat;

seat = pointer_null;
requested_drink = pointer_null;
pathing_complete = false;

idle_time = irandom_range(5, 10);
patience_time = irandom_range(15, 30);

target_seat = noone;
pathing_started = false;
var menu = bar_menu.menu_active;


if (ds_list_size(menu) > 0) {
    var rand_index = irandom(ds_list_size(menu)-1 );
    var rand_item = menu[| rand_index];

    
    requested_drink = rand_item;
	
}

hide_order = true;


