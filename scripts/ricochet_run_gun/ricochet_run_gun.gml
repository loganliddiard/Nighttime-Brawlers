// ==========================
//  RICOCHET RUNNER – LOGIC
// ==========================
function ricochet_run_gun() {
	
	is_moving = true; //reset our variable
	
    // --- Calculate intended step ---
    var dx = lengthdir_x(move_speed, dir);
    var dy = lengthdir_y(move_speed, dir);
    var step_x = x + dx;
    var step_y = y + dy;

    // --- If the full move is clear, just go ---
    if (!place_meeting(step_x, step_y, obj_wall) && !place_meeting(step_x,step_y,obj_bar)) {
        x = step_x;
        y = step_y;
    }
    else
    {
        // --- Determine which axis (or both) is blocked ---
        var blockedX = place_meeting(step_x, y, obj_wall) || place_meeting(step_x, y, obj_bar);
        var blockedY = place_meeting(x, step_y, obj_wall) || place_meeting(x, step_y, obj_bar);

        if (blockedX) {
            dx  = -dx;                    // mirror X
            dir = 180 - dir;              // update heading
        }
        if (blockedY) {
            dy  = -dy;                    // mirror Y
            dir = -dir;                   // update heading
        }

        // Keep dir in 0-359 range
        dir = (dir + 360) mod 360;

        // Try the adjusted move (prevents sticking in corners)
        step_x = x + dx;
        step_y = y + dy;

        if (!place_meeting(step_x, step_y, obj_wall)) {
            x = step_x;
            y = step_y;
        }
		
    }
	
	// === Attack logic ===
    if (can_fire) {
        var b = instance_create_layer(x, y, "Bullets", obj_enemy_bullet);
        b.direction = point_direction(x, y, obj_player.x, obj_player.y);
        b.speed = 3;
        can_fire = false;
        alarm[0] = game_get_speed(gamespeed_fps) * fire_cooldown;
    }


}