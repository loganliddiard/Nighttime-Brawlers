/// obj_minigame_manager: Create
active = false;
on_result = undefined; // function reference
overlay_alpha = 0;

w_width = 9;
w_hieight = 7;


function activate(mini_game){
	active = true;
	
	instance_create_layer(x,y,"Instances",mini_game);

}

function get_result(reward,amount,status){
	
	if(status == "Win"){
		//apply rewards
		
		//give player quick single beverage
		for(var i = 0; i < array_length(obj_player.hands);i++){
			if(obj_player.hands[i] == -1){
				obj_player.hands[i] = reward;
				
				amount -=1;
				if (amount == 0) break;
				
			}

		}
	
	}
	else{
		//apply punishment
	
	}
	
	active = false;
	obj_player.current_state = play_state.idle;



}