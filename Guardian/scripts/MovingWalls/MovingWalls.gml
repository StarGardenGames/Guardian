if(irandom(movechance)!=1) exit;
with(oWall){
	if(state != WALL_STATE.inactive) exit; 	
}
var randomwall = irandom(instance_number(oWall)-1);
with(instance_find(oWall, randomwall)){
	state = WALL_STATE.moving_in;
}