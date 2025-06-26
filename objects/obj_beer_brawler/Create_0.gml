behavior_function = berserker_behavior;

spawn_in_x   = noone;
spawn_in_y   = noone;

enemy_health = 15;          // tweak to taste

move_speed   = 3;           // constant rush speed

cooldown = false;
hit_cooldown_timer = 1.5;
dir = 0;

slide_mode = false;   // true while it’s sliding along the bar
slide_dir  = 0;       // cached direction to keep while sliding
// =======================
//  BERSERKER – BEHAVIOR
// =======================
function berserker_behavior() {

    // ---------------------------------
    //  A)  SLIDE MODE (already on bar)
    // ---------------------------------
    if (slide_mode) {
        // keep moving half-speed along saved direction
        var step_x = x + lengthdir_x(move_speed / 2, slide_dir);
        var step_y = y + lengthdir_y(move_speed / 2, slide_dir);

        // stay on bar but don’t phase through walls
        if (place_meeting(step_x, step_y, obj_bar) &&
            !place_meeting(step_x, step_y, obj_wall))
        {
            x = step_x;
            y = step_y;
            // still able to hurt the player while sliding
        }
        else {
            slide_mode = false; // slid off bar or hit a wall – resume chase
        }
    }

	if (cooldown) exit;   // still in hit-cooldown, do nothing


    // ---------------------------------
    //  B)  NORMAL CHASE MODE
    // ---------------------------------
    if (!slide_mode) {
        dir = point_direction(x, y, obj_player.x, obj_player.y);
        var step_x = x + lengthdir_x(move_speed, dir);
        var step_y = y + lengthdir_y(move_speed, dir);

        // If the next step *isn’t* a wall…
        if (!place_meeting(step_x, step_y, obj_wall)) {

            // …but *is* the bar ➜ enter slide mode
            if (place_meeting(step_x, step_y, obj_bar)) {
                slide_mode = true;
                slide_dir  = dir;                 // lock the current heading
                // first slide step at half-speed
                step_x = x + lengthdir_x(move_speed / 2, slide_dir);
                step_y = y + lengthdir_y(move_speed / 2, slide_dir);
            }

            x = step_x;
            y = step_y;
        }
        // crude wall slide (only if *not* on bar)
        else {
            if (!place_meeting(step_x, y, obj_wall)) x = step_x;
            if (!place_meeting(x, step_y, obj_wall)) y = step_y;
        }
    }

    // ---------------------------------
    //  C)  CONTACT / KNOCKBACK
    // ---------------------------------
    if (place_meeting(x, y, obj_player)) {
        with (obj_player) {
            if (current_state == play_state.behind_bar) {
                current_state = play_state.idle;  // knock out of cover
            }

            var knock_dir = point_direction(other.x, other.y, x, y);
            var knock_strength = 6;

            knockback_dx   = lengthdir_x(knock_strength, knock_dir);
            knockback_dy   = lengthdir_y(knock_strength, knock_dir);
            knockback_timer = 7;
        }

        cooldown  = true;
        alarm[0]  = game_get_speed(gamespeed_fps) * hit_cooldown_timer;
    }
}
