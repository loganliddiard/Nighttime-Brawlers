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



// Fill the pool
global.shop_pool = [
    create_shop_item("'Shot' gun", spr_shotgun, 15, "Shoots a spread of bullets dealing a good amount of damage.", give_gun("shotgun")),
    create_shop_item("Hearty Wine", spr_martini, 15, "Gives you +1 max health", function() { obj_player.max_health += 1; }),
    create_shop_item("Discount", spr_register, 8, "Reduces item prices in future shops.", function() { obj_player.shop_discount += 0.1; })
];

shop.populate_shop()