function handle_interaction(facing_direction,tar_x,tar_y){


    switch (facing_direction) {
        case "up":
			instance_create_layer(tar_x,tar_y-game.cs,"Instances",obj_interact);
            break;
        case "down":
			instance_create_layer(tar_x,tar_y+game.cs,"Instances",obj_interact);
            break;
        case "left":
            instance_create_layer(tar_x-game.cs,tar_y,"Instances",obj_interact);
            break;
        case "right":
            instance_create_layer(tar_x+game.cs,tar_y,"Instances",obj_interact);
            break;
    }

	
}