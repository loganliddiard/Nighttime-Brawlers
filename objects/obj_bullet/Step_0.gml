x += lengthdir_x(move_speed, direction);
y += lengthdir_y(move_speed, direction);

if( place_meeting(x,y,obj_wall)){

	instance_destroy(self);

}