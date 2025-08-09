function handle_interaction(facing_direction,press_type,tar_x,tar_y){

	var obj = noone;
    switch (facing_direction) {
        case "up":
			obj = instance_create_layer(tar_x,tar_y-game.cs,"Instances",obj_interact);
            break;
        case "down":
			obj = instance_create_layer(tar_x,tar_y+game.cs,"Instances",obj_interact);
            break;
        case "left":
            obj = instance_create_layer(tar_x-game.cs,tar_y,"Instances",obj_interact);
            break;
        case "right":
            obj = instance_create_layer(tar_x+game.cs,tar_y,"Instances",obj_interact);
            break;
    }
	
	if (obj != noone){
		with (obj){
			type = press_type;
		}
	}

	
}