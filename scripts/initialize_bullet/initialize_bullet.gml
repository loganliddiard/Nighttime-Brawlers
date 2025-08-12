function initialize_bullet(_damage,_lifetime,_offset,_speed){
	
	//apply longer lifetimes from long barrel perk here
	if(weapons_data.long_barrel){
		_lifetime *= 1.5;
	}
	
	var bullet = instance_create_layer(obj_player.x,obj_player.y,"Bullets",obj_bullet);
	
	// Get angle from player to mouse
	var angle = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y);

	// Set speed and direction
	bullet.direction = angle+_offset;
	bullet.move_speed = _speed; // adjust as needed
	bullet.damage = _damage;
	
	with(bullet){
	
		move_speed = _speed;
		alarm[0] = game_get_speed(gamespeed_fps) * _lifetime;
	
	}

}