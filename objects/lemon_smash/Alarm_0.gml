
// Alarm[0]
if (presses >= target_button_press) {
    result = "Win";
} else {
    result = "Lost";
}

micro_game.get_result(drink_reward, 3, result);

instance_destroy(self);