// phase gate
if (game.current_phase != phase.last_call) {
    instance_destroy();
    exit;
}

// ----- health / death handling -----
if (!is_dead && enemy_health <= 0) {
    is_dead = true;
    can_fire = false;
    can_move = false;
    is_moving = false;
    set_state(EnemyState.DIE);
}

// run AI only when not dead and not in hurt-stun
if (!is_dead && hurt_stun <= 0) {
    behavior_function();
}

// work out desired state (don’t reset every step if unchanged)
if (is_dead) {
    // stay in DIE until anim finishes
} else if (hurt_stun > 0) {
    set_state(EnemyState.HURT);
    hurt_stun -= 1;
} else if (is_moving) {
    set_state(EnemyState.WALK);
} else {
    set_state(EnemyState.IDLE);
}

// face the player (or, use x velocity if you prefer)
if (obj_player.x != x) {
    face = (obj_player.x > x) ? 1 : -1;
}

// ----- ANIMATION UPDATE -----
var fpss = row_fps[state];
anim_timer += 1;
if (anim_timer >= max(1, game_get_speed(gamespeed_fps) / fpss)) {
    anim_timer = 0;
    anim_frame += 1;

    if (anim_frame >= row_len[state]) {
        if (row_loop[state]) {
            anim_frame = 0;
        } else {
            anim_frame = row_len[state] - 1; // clamp on last frame
            // end of death anim -> destroy
            if (state == EnemyState.DIE) {
                instance_destroy();
                exit;
            }
            // end of HURT anim -> pop back to idle/walk next frame
            if (state == EnemyState.HURT) {
                // no-op; next loop the state logic will set IDLE/WALK
            }
        }
    }
}
