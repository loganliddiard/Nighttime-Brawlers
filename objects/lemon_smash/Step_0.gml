
if(keyboard_check_pressed(vk_space)){

	presses += 1;
	
	lemon_stage = clamp(floor(presses / 5)-1,0,4); //ensures we don't roll over to other frames

	
	
}