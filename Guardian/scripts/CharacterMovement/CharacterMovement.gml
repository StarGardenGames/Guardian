switch(state){
	
	case CHAR_STATE.selected:
		if(!checkHeld("slow")){
			dx = checkHeld("right") - checkHeld("left"); 
			dy = checkHeld("down") - checkHeld("up");
			var m = max(1,point_distance(0, 0, sign(dx), sign(dy)))
			dx /= m
			dy /= m
	
			x += dx * moveSpeed * slowfactor;
			y += dy * moveSpeed * slowfactor;			
		}
		break;
	case CHAR_STATE.attracted:
		path_end();
		if(instance_number(oAttractor) > 0){
			var attractor = instance_nearest(x,y,oAttractor)
			var dir = point_direction(x,y,attractor.x,attractor.y)
			x += moveSpeed * slowfactor * cos(dir) / 4;
			y -= moveSpeed * slowfactor * sin(dir) / 4;
		}else{
			path_start(path,moveSpeed,path_action_continue,false);	
		}
		break;
}

var safetynet = instance_place(x,y,oSafetyNet)
if(safetynet != noone && safetynet.state == SAFETY_STATE.empty){
	state = CHAR_STATE.safe;
	safetynet.state = SAFETY_STATE.caught;
	safetynet.char = id;
	with(safetynet) alarm[0] = 150;
	SelectCharacter();
}

// xprevious doesn't work for paths :'(
if((x-xprev) != 0){
	image_xscale = start_scale*sign(x-xprev)
}