

if(seq_idx < array_length(sequence)){
	tap_picked = sequence[seq_idx];
	seq_idx +=1;	
	alarm[2] = game_get_speed(gamespeed_fps)*(show_sequence_timer/2);
}else{

	show_sequence = false;
	tap_picked = 0;
	seq_idx = 0;

}