behavior_function = theivery;
spawn_in_x = noone;
spawn_in_y = noone;

enemy_health = 10;

drop_money = true;

is_fleeing = false;

move_range = 96;
preferred_range = 64;

fire_cooldown = irandom_range(60, 120);
move_cooldown = irandom_range(60, 120);
move = irandom_range(60, 120);
can_fire = true;
can_move = true;
is_moving = false;

target_x = -1;
target_y = -1;

var total = instance_number(obj_register);
if (total > 0) {
	var random_index = irandom(total - 1);
	var selected_register = instance_find(obj_register, random_index);
	target_x = selected_register.x;
	target_y = selected_register.y - game.cs;		
}


move_speed = 4;

stolen_cash = 0;
stealing = false;
steal_time = irandom_range(1,2);

timer_called = false;


