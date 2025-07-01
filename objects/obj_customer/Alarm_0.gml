
y-=32;
seat.is_taken = false;

	
var tip_chance = random_range(1,10);
if(tip_chance>=game.tip_chance) game.tip_money +=  random_range(5,10);



current_state = cust_state.leaving;