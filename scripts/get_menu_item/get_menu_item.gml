function get_menu_item(search_for){

	
	var menu = bar_menu.menu_master;

	for (var i = 0; i < ds_list_size(menu); i++) {
	    var item = menu[| i];
		
	    if (item.name == search_for) {
			
	        return item;
			
	    }
	}


	return -1;

}