
if(cubes_caught >= 3){

	result = "Win";
} else{

	result = "Lost"
}


micro_game.get_result(drink_reward, 3, result);
instance_destroy(self);