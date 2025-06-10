
for(var i = 0; i < array_length(obj_player.hands);i++){
	if(obj_player.hands[i] == -1){
		obj_player.hands[i] = "Martini";
		break;
	}

}

instance_destroy(self);