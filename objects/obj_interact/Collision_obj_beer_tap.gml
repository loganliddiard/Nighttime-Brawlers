


if(type == "Short"){
	//give player quick single beverage
	for(var i = 0; i < array_length(obj_player.hands);i++){
		if(obj_player.hands[i] == -1){
			obj_player.hands[i] = other.drink_name;
			break;
		}

	}
}

if(type == "Long"){

	//initialize minigame
	
	obj_player.current_state = play_state.busy;
	micro_game.activate(other.mini_game)
	
	

}


instance_destroy(self);