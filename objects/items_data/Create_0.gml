function create_shop_item(_name, _sprite, _price, _desc, _effect_func) {
    return {
        name: _name,
        spr: _sprite,
        price: _price,
        description: _desc,
        onBuy: _effect_func
    };
}

// Example effect functions
function give_speed_boost() {
    obj_player.speed += 1.5;
}

function give_gun(gun_id) {
    for (var i = 0; i < array_length(global.weapons); ++i) {
        var gun = global.weapons[i];
        if (gun.id == gun_id) {
            obj_player.weapon = gun;
            return true; // success
        }
    }
	show_message("Uh oh! Gun: "+string(gun_id)+" not found!");
    return false; // gun not found
}

function spawn_stool(){
	var total = instance_number(obj_buyable_stool);
	if (total > 0) {
		var random_index = irandom(total - 1);
		var selected_stool = instance_find(obj_buyable_stool, random_index);
		instance_destroy(selected_stool);
	}

}

function modify_price(target_drink, percent_change){

	var found = false;
	for (var i = 0; i < ds_list_size(bar_menu.menu_master); i++) {
    if (bar_menu.menu_master[| i].name == target_drink) {
        bar_menu.menu_master[| i].price *= percent_change;
		found = true;
        break;
    }
}
#endregion

//should never see this message
if (!found) {show_message("Error! Attempted to modify price of  " +target_drink +" but it was not found!" );}
}

function install_station(station){

	if(station.station_type == "Beer"){
		
	}
	else{
		
	}

}
// Fill the pool
global.shop_pool = [

    create_shop_item("'Shot' gun", spr_shotgun, 150, "Shoots a spread of bullets dealing a good amount of damage.",function(){ give_gun("shotgun")}),
    create_shop_item("Hearty Wine", spr_martini, 70, "Gives you +1 max health", function() { obj_player.max_health += 1; obj_player.player_hp +=1; }),
    create_shop_item("Discount", spr_price_tag, 60, "Reduces item prices in future shops.", function() { obj_player.shop_discount += 0.1; }),
	create_shop_item("Drink Tray",spr_reroll, 35, "Allows you to carry more drinks.", function() { array_resize(obj_player.hands, array_length(obj_player.hands)+1); obj_player.hands[array_length(obj_player.hands)-1] = -1 }),
	create_shop_item("Extra Stool",spr_stool,75,"Allows for 1 extra seat at your bar.", function() { spawn_stool() }),
	create_shop_item("Quality Wheat",spr_beer,100,"Sell price of Beer is doubled.", function() { modify_price("Beer",2) }),
	create_shop_item("Quality Olives",spr_martini,100,"Sell price of Martinis is doubled.", function() {  modify_price("Martini",2)}),
	create_shop_item("Tip Jar",spr_register,75,"Increases chances of customers to tip by 10%.", function() {  game.tip_chance += 1})
	
];

shop.populate_shop();