if(drop_money && stolen_cash > 0){

	var bag = instance_create_layer(x,y,"Instances",obj_money_bag);
	var money = stolen_cash;
	with (bag){
	
		value = money;
	}
}