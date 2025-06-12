
current_phase = phase.last_call;
cs = 32;

money = 0;

global.grid = mp_grid_create(0, 0, room_width div cs, room_height div cs, cs, cs);
mp_grid_add_instances(global.grid, obj_collision, false);


enum phase {

	serve, //customers come in and out as they please
	last_call, //unique enemy raid
	upkeep, // show shop menu go to next day

}

