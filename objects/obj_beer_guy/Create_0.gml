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

function ranged_skirmisher_behavior() {
    var dist_to_player = point_distance(x, y, obj_player.x, obj_player.y);

    // === Move logic ===
    if (is_moving) {
        var dx = target_x - x;
        var dy = target_y - y;
        var step_dist = move_speed;

        if (abs(dx) < step_dist && abs(dy) < step_dist) {
            x = target_x;
            y = target_y;
            is_moving = false;
        } else {
            var angle = point_direction(x, y, target_x, target_y);
            var step_x = x + lengthdir_x(step_dist, angle);
            var step_y = y + lengthdir_y(step_dist, angle);

            // Only move if not hitting a wall
            if (!place_meeting(step_x, step_y, obj_wall)) {
                x = step_x;
                y = step_y;
            } else {
                // Hit a wall — pick new direction away from wall/player
                is_moving = false;

                var new_angle = point_direction(obj_player.x, obj_player.y, x, y) + irandom_range(-45, 45); // away
                var new_x = x + lengthdir_x(move_range, new_angle);
                var new_y = y + lengthdir_y(move_range, new_angle);

                if (!position_meeting(new_x, new_y, obj_wall)) {
                    target_x = new_x;
                    target_y = new_y;
                    is_moving = true;
                }
            }
        }

        return;
    }

    // === Attack logic ===
    if (can_fire) {
        var b = instance_create_layer(x, y, "Bullets", obj_enemy_bullet);
        b.direction = point_direction(x, y, obj_player.x, obj_player.y);
        b.speed = 3;
        can_fire = false;
        alarm[0] = fire_cooldown;
    }

    // === Start new movement if allowed ===
    if (can_move && (dist_to_player < preferred_range || irandom(100) < 10)) {
        var angle;

        // Too close to player — move away
        if (dist_to_player < preferred_range) {
            angle = point_direction(obj_player.x, obj_player.y, x, y) + irandom_range(-30, 30); // away
        } else {
            // Random evasion angle
            angle = irandom_range(0, 359);
        }

        var new_x = x + lengthdir_x(move_range, angle);
        var new_y = y + lengthdir_y(move_range, angle);

        if (!position_meeting(new_x, new_y, obj_wall)) {
            target_x = new_x;
            target_y = new_y;
            is_moving = true;
        }

        can_move = false;
        alarm[1] = move_cooldown;
    }
}
