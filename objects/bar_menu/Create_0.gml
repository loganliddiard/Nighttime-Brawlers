// Master dictionary of all known menu items (whether or not they’re unlocked)
menu_master = ds_list_create();

// Current active menu
menu_active = ds_list_create();

//Add items on game start
ds_list_add(menu_master,create_menu_item("Beer", "beer",5, spr_beer));
ds_list_add(menu_master,create_menu_item("Martini","cocktail",7,spr_martini));



//Add starter items
add_active_menu_item("Beer");
add_active_menu_item("Martini");


