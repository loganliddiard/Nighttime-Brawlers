// Alarm[0]
if (abs(poured - target) <= buffer) {
    result = "Win";
} else {
    result = "Lost";
}

micro_game.get_result(drink_reward, 3, result);



instance_destroy(self);