
current_phase = phase.upkeep;
cs = 32;
day = 1;

serve_time = 120; //default should be 120
last_call_time = 90; //default should be 90
transition_time = 3; //default is 3 (may change later

rent_amount = 100; //first weeks rent is 100 dollars

total_money = 1000000; //thes should always start at zero but can be adjusted for debugging
earned_money = 0;
tip_money = 0;

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

tip_chance = 0;