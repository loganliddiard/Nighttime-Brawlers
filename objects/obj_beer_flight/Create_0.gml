behavior_function = theivery;
spawn_in_x = noone;
spawn_in_y = noone;

enemy_health = 10;

drop_money = true;

is_fleeing = false;

move_range = 96;
preferred_range = 64;

can_fire = true;
can_move = true;
is_moving = false;

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

function theivery() {
    var step_dist = move_speed;

    // === STEAL MODE ===
if (stolen_cash == 0) {
    var dx = target_x - x;
    var dy = target_y - y;
    var step_dist = move_speed;

    if (abs(dx) < step_dist && abs(dy) < step_dist) {
        x = target_x;
        y = target_y;

        if (!stealing) {
            stealing = true; // Only set once
            alarm[0] = game_get_speed(gamespeed_fps) * steal_time;
        }

        return;
    } else {
        var angle = point_direction(x, y, target_x, target_y);
        var step_x = x + lengthdir_x(step_dist, angle);
        var step_y = y + lengthdir_y(step_dist, angle);

        if (!place_meeting(step_x, step_y, obj_wall)) {
            x = step_x;
            y = step_y;
        }
		
    }

    return;
}

    // === FLEE MODE ===
    var dx = target_x - x;
    var dy = target_y - y;

    if (abs(dx) < step_dist && abs(dy) < step_dist) {
        // Reached escape point — destroy or mark as escaped
		drop_money = false;
        instance_destroy(); // or change state
    } else {
        var angle = point_direction(x, y, target_x, target_y);
        var step_x = x + lengthdir_x(step_dist, angle);
        var step_y = y + lengthdir_y(step_dist, angle);

        if (!place_meeting(step_x, step_y, obj_wall)) {
            x = step_x;
            y = step_y;
        } else {
            // Fallback if wall hit during escape — run opposite direction
            var new_angle = angle + 180 + irandom_range(-30, 30);
            var new_x = x + lengthdir_x(move_range, new_angle);
            var new_y = y + lengthdir_y(move_range, new_angle);

            if (!position_meeting(new_x, new_y, obj_wall)) {
                target_x = new_x;
                target_y = new_y;
            }
        }
    }
}
