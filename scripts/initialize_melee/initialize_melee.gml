function initialize_melee(_damage, _lifetime) {

	// Get angle from player to mouse
	var angle = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y);

	// Calculate spawn position 16 pixels away from player along that angle
	var spawn_x = obj_player.x + lengthdir_x(32, angle);
	var spawn_y = obj_player.y + lengthdir_y(32, angle);

	// Create hitbox at the offset position
	var hitbox = instance_create_layer(spawn_x, spawn_y, "Bullets", obj_melee);

	// Set direction and other properties
	hitbox.direction = angle;
	hitbox.damage = _damage;

	with (hitbox) {
		alarm[0] = game_get_speed(gamespeed_fps) * _lifetime;
	}
}