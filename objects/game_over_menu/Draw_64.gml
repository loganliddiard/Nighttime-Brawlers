// Draw "Game Over"
draw_text(display_get_width() / 2, display_get_height() / 4, "GAME OVER");


var y_buff = 60
for (var i = 0; i < array_length(options); i++){

	if(selection == i) draw_set_color(c_yellow);
	else draw_set_color(c_white);
	draw_text(display_get_width()/2, display_get_height()/2 + (y_buff*i), options[i][0]);
}

draw_set_color(c_white);
