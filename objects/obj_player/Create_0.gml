
invincible = false;
hit_cooldown = false;
hit_cooldown_timer = .5

move_speed = 3;

roll_speed = move_speed * 2;
roll_time = .25;
roll_cooldown_time = .25;
roll_dx = 0;
roll_dy = 0;

knockback_dx = 0;
knockback_dy = 0;
knockback_timer = 0;

can_roll = true; //for cooldowns

bar_move_speed = move_speed - .5;

facing_direction = "right";

enum play_state{

	idle,
	busy,
	walk,
	behind_bar,
	ducking,
	dodge,
	

}

//changable variables
player_hp = 6;
max_health = 6;
extra_shop_slots = 0;
max_health = 3;
shop_discount = 0;
weapon = noone;

current_state = play_state.idle;

hands = [-1,-1,-1]