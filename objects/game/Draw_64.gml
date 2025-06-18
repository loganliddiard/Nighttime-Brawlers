
draw_set_font(fnt_basic);
draw_text(20,20,"Hands:");
draw_text(20,50,obj_player.hands[0]);
draw_text(20,80,obj_player.hands[1]);
draw_text(20,110,obj_player.hands[2]);

draw_text(20,140,string(money)+"$");

if(instance_exists(obj_player)){
	draw_text(20,180,obj_player.current_state);
	draw_text(20, 280,"Health: "+string(obj_player.player_hp));
}

//from to swap
switch(current_phase){
	case(phase.transition):
	
	draw_text(20,220,"Transitional Phase");
	
	break;
	case(phase.serve):
	
	draw_text(20,220,"Serving Phase");
	break;
	
	case(phase.last_call):
	draw_text(20,220,"Last Call Phase");

	break;

}