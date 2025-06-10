if(current_state== cust_state.leaving){
	obj_door.free_seats +=1;
	instance_destroy(self);
}