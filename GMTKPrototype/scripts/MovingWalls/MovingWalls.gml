if(irandom(100)!=1) exit;
var rand = irandom(3);
var edge = screenEdge[rand];
var inst = noone;
with(oWall){
	if(state != WALL_STATE.inactive) exit; 	
}
var randomwall = irandom(instance_number(oWall)-1);
with(instance_find(oWall, randomwall)){
	state = WALL_STATE.moving_in;
}