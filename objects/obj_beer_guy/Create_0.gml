// ==== ANIMATION SETUP ====
// your existing variables stay as-is

behavior_function = ranged_skirmisher_behavior;

spawn_in_x = noone;
spawn_in_y = noone;

enemy_health = 10;


fire_cooldown = irandom_range(60, 120);
move_cooldown = irandom_range(60, 120);

move_range = 96;
preferred_range = 64;

can_fire = true;
can_move = true;
is_moving = false;


target_x = x;
target_y = y;

move_speed = 2;


spr_sheet = spr_beer_flight_sheet;     // your spritesheet resource
frame_w   = 32;            // << set your actual frame size
frame_h   = 48;            // << set your actual frame size

enemy_health = 10;

enum EnemyState { IDLE=0, WALK=1, HURT=2, DIE=3 }
state = EnemyState.IDLE;

// how many columns each row has (per your description)
row_len = [ 1, 5, 3, 6 ];  // << set death frame count correctly

// animation timing (fps per state)
row_fps = [ 2, 8, 10, 8 ];

// should the row loop?
row_loop = [ true, true, false, false ];

anim_frame = 0;
anim_timer = 0;

// small helper: switch state cleanly
function set_state(_s) {
    if (state != _s) {
        state = _s;
        anim_frame = 0;
        anim_timer = 0;
    }
}

// face direction: 1 = right, -1 = left
face = 1;

// hurt stun frames (how long HURT “locks” them)
hurt_stun = 0;

// if you want the death anim to play before destroy:
is_dead = false;
