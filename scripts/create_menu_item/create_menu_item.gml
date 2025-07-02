function create_menu_item(name,type, price,icon, table_sprite, mini_game_obj) {
    var item = {
        name: name,
		type: type,
        price: price,
        icon: icon,
		table_sprite: table_sprite,
		mini_game: mini_game_obj
    };
	
	return item;
}