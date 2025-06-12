global.weapons = [
    {
        id: "pistol",
        name: "Standard Pistol",
        damage: 5,
		lifetime: 2,
        cooldown: 20,
		bullet_speed: 6,
        sprite: spr_pistol,
        fire_function: function(player) {

            initialize_bullet(damage,lifetime,irandom_range(-10, 10),bullet_speed)
        }
    },
    {
        id: "shotgun",
        name: "Shotgun",
        damage: 10,
		lifetime: 1,
        cooldown: 40,
		bullet_speed: 10,
        pellets: 5,
        sprite: spr_pistol,
        fire_function: function(player) {
            for (var i = 0; i < 5; i++) {
                var b = instance_create_layer(player.x, player.y, "Bullets", obj_bullet);
                b.direction += irandom_range(-10, 10); // spread
            }
        }
    }
];


obj_player.weapon = global.weapons[0];