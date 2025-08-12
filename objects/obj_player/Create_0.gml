
spr_player_base = spr_frank_sprite_sheet;
spr_player_hands = spr_hands_sheet;


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

// Base rows
enum BaseAnim {
    IDLE = 0,
    WALK = 1,
    DODGE = 2,
    DUCK = 3,
}

// Hand rows
enum HandAnim {
    IDLE = 0,
    WALK = 1,
    DRINK = 2,
	
    GUN_BASE = 3  // Start gun rows here
}

animation_state = BaseAnim.IDLE;
hands_animation_state = HandAnim.IDLE;


//press duration variables
press_time = 0;
pressing = false;
action_fired = false;
press_threshold = 0.5 * game_get_speed(gamespeed_fps); // ~0.8s

//changable variables
player_hp = 6;
max_health = 6;
extra_shop_slots = 0;
max_health = 3;
shop_discount = 0;
weapon = noone;
can_fire = true;
current_state = play_state.idle;
sprite_dir = 1; // 1 -> right, -1 -> left
hands = [-1,-1,-1]