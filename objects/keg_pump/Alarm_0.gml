// Alarm[0]

if(pressure >= target-buffer and pressure <= target+ buffer){

	 result = "Win";

}
 else {
    result = "Lost";
}

micro_game.get_result(drink_reward, 3, result);



instance_destroy(self);