

if (pressure > 0){
	
	pressure -= pressure_loss_rate;

}

if(pressure >= target-buffer and pressure <= target+ buffer){

	status = 1;

} else {

	status = 0;
}


if keyboard_check(vk_space){
	
	if(pump_down > 0 ){
		pump_down -=1;
		if(pressure+pump_up_rate <= max_pressure){
			pressure += pump_up_rate;
		}
	}
}
else{
	
	if(pump_down < max_pump_down){
	
		pump_down += 1;
	}
	
}