// Master dictionary of all known menu items (whether or not they’re unlocked)
menu_master = ds_list_create();

// Current active menu
menu_active = ds_list_create();

//Add items on game start
ds_list_add(menu_master,create_menu_item("Beer", "beer",5, spr_beer,spr_beertap,pour_beer));
ds_list_add(menu_master,create_menu_item("Martini","cocktail",7,spr_martini,spr_mixtable,olive_stab));

ds_list_add(menu_master,create_menu_item("IPA","beer",10,spr_ipa,spr_ipa_tap,memory_taps));
ds_list_add(menu_master,create_menu_item("Amber Ale","beer",8,spr_amber_ale,spr_amber_ale_tap,keg_pump));

ds_list_add(menu_master,create_menu_item("Rum and Cola","cocktail",9,spr_rum_and_cola,spr_rum_and_cola_station,noone));
ds_list_add(menu_master,create_menu_item("Lemon Drop","cocktail",11,spr_lemon_drop,spr_lemon_drop_station,lemon_smash));


//Add starter items
add_active_menu_item("Beer");
add_active_menu_item("Martini");


