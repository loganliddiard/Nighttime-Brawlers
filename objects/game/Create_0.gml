
current_phase = phase.transition;
cs = 32;
day = 3;

serve_time = 120;
last_call_time = 90;
transition_time = 3;

rent_amount = 100;

total_money = 0;
earned_money = 0;

global.grid = mp_grid_create(0, 0, room_width div cs, room_height div cs, cs, cs);
mp_grid_add_instances(global.grid, obj_collision, false);


enum phase {

	transition,
	serve, //customers come in and out as they please
	last_call, //unique enemy raid
	upkeep, // show shop menu go to next day
	shop,

}

//alarm[0] = game_get_speed(gamespeed_fps) * .5;

player_died = false;
alarm[1] = game_get_speed(gamespeed_fps) * 1;
