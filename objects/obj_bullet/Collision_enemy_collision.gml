/// @func take_damage(amount)
/// @desc Reduce health, trigger hurt-stun when still alive.

var amount = damage;
with(other){

    
    enemy_health -= amount;
    if (enemy_health > 0) {
        // brief lock where we show HURT row
        hurt_stun = round(game_get_speed(gamespeed_fps) * 0.25); // 0.25s, tweak as you like
        can_move = false; is_moving = false;
        alarm[1] = move_cooldown; // restart move cooldown if you like
    }

}

instance_destroy(self);