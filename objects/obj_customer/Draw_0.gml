

draw_sprite(spr_customer,0,x,y);



switch(current_state){

	case (cust_state.ordering):
	
	draw_sprite(spr_bubble,0,x,y-game.cs);
	draw_sprite(spr_request,0,x,y-game.cs);
	
	break;
	
	case (cust_state.waiting):
	draw_sprite(spr_bubble,0,x,y-game.cs);
	draw_sprite(requested_drink.icon,0,x,y-game.cs);
	
	
	
	break;


}


