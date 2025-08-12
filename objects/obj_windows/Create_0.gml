
broken = false;

current_x = x;
current_y = y;	

function spawn_enemy(enemy){

	
	var inst = instance_create_layer(x,y+game.cs,"Instances",enemy);
	var cur_x = x;
	var cur_y = y+game.cs;
	with(inst){
		spawn_in_x = cur_x;
		spawn_in_y = cur_y+game.cs;
	}
	//show_message("spawned at ("+string(c_x)+","+string(c_y)+")");
}