function add_active_menu_item(name){
	
	var found = false;
	for (var i = 0; i < ds_list_size(bar_menu.menu_master); i++) {
    if (bar_menu.menu_master[| i].name == name) {
        ds_list_add(bar_menu.menu_active, bar_menu.menu_master[| i]);
		found = true;

        break;
    }
}

//should never see this message
if (!found) {show_message("Error! Attempted to add " +name +" but it was not found!" );}

}