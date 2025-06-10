function check_for_drinks(search,reward){
	
	
	for(var i = 0; i < array_length(obj_player.hands);i++){
	if(obj_player.hands[i] == search){
		
		obj_player.hands[i] = -1;	
		game.money += reward;
		return true;
		
		break;
	}
	
	

}
return false;

}