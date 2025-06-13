// Alarm[0] — called after stealing
target_x = spawn_in_x;
target_y = spawn_in_y;

stolen_cash = irandom_range(50, 150);
if (stolen_cash > game.money) {
    stolen_cash = game.money;
}
game.money -= stolen_cash;

stealing = false; // Just in case
