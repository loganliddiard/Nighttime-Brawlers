
draw_set_font(fnt_basic);
draw_text(20,20,"Hands:");
draw_text(20,50,obj_player.hands[0]);
draw_text(20,80,obj_player.hands[1]);
draw_text(20,110,obj_player.hands[2]);

draw_text(20,140,string(money)+"$");

draw_text(20,180,obj_player.current_state);