global.weapons = [
    {
        id: "pistol",
        name: "Standard Pistol",
        damage: 5,
		lifetime: 2,
        cooldown: .5,
		bullet_speed: 6,
        sprite: spr_pistol,
		scale: .5,
		is_auto: false, 
		
        fire_function: function(player) {

            initialize_bullet(damage,lifetime,irandom_range(-10, 10),bullet_speed)
        }
    },
    {
        id: "shotgun",
        name: "Shotgun",
        damage: 10,
		lifetime: .25,
        cooldown: .5,
		bullet_speed: 10,
        pellets: 5,
        sprite: spr_shotgun,
		scale: 1,
		is_auto: false, 
        fire_function: function(player) {
            for (var i = 0; i < 5; i++) {
                initialize_bullet(damage,lifetime,irandom_range(-20, 20),bullet_speed)
            }
        }
    },
	{
    id: "olive launcher",
    name: "Olive Launcher",
    damage: 3,
	lifetime: .45,
    cooldown: .1,
	bullet_speed: 8,
	is_auto: true,
    sprite: spr_olive_launcher,
	scale: 1,
	
    fire_function: function(player) {
        
		initialize_bullet(damage,lifetime,irandom_range(-40, 40),bullet_speed)
        
    }
},
	{
    id: "pirates pleasure",
    name: "Pirates Pleasure",
    damage: 5,
	lifetime: .85,
    cooldown: .2,
	bullet_speed: 6,
	is_auto: true,
    sprite: spr_pirates_pleasure,
	scale: 1,
    fire_function: function(player) {
    
	initialize_bullet(damage,lifetime,irandom_range(-30, 30),bullet_speed)
        
    }
},
	{
    id: "sour shooter",
    name: "Sour Shooter",
    damage: 15,
	lifetime: 1,
    cooldown: .6,
	bullet_speed: 12,
	is_auto: false,
    sprite: spr_sour_shooter,
	scale: 1,
    fire_function: function(player) {
      
     initialize_bullet(damage,lifetime,irandom_range(-2, 2),bullet_speed)
        
    }
}
];


obj_player.weapon = global.weapons[3];