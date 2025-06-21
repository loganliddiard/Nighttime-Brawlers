


if(keyboard_check_pressed(ord("S"))){

	selection +=1;
	if (selection > array_length(options)-1){
		selection = 0;
	}

}
else if(keyboard_check_pressed(ord("W"))){

	selection -= 1;
	if (selection < 0){
		selection = array_length(options)-1;
	}

}
else if(keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)){
	
	var function_= options[selection][1];
	function_();
}




