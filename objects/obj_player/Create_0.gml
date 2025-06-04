
move_speed = 3;

facing_direction = "right";

enum play_state{

	idle,
	busy,
	walk,
	shoot,
	dodge,
	

}

current_state = play_state.idle;

hands = [-1,-1,-1]