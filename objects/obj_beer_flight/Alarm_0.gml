// Alarm[0] — called after stealing
target_x = spawn_in_x;
target_y = spawn_in_y;

stolen_cash = irandom_range(50, 150);
if (stolen_cash > game.earned_money) {
    stolen_cash = game.earned_money;
}

if(stolen_cash == 0) behavior_function = ranged_skirmisher_behavior;
game.earned_money -= stolen_cash;

stealing = false; // Just in case
