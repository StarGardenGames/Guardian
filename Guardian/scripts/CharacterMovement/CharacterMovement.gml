oif(state != prevstate){
	if(state == CHAR_STATE.unselected){
		if(object_is_ancestor(object_index, oCharacterPath)){
			path_start(path,moveSpeed,path_action_continue,false);
		}
		if(object_is_ancestor(object_index, oCharacterCustom)){
			var xs = record[? "xs"]
			var ys = record[? "ys"]
			if(ds_list_size(xs) > 0){
				base_x = x - (xs[| floor(pos_index) % ds_list_size(xs)] - xs[|0])
				base_y = y - (ys[| floor(pos_index) % ds_list_size(ys)] - ys[|0])
			}
		}
	}

	if(prevstate == CHAR_STATE.unselected){
		if(object_is_ancestor(object_index, oCharacterPath)){
			path_end();
		}	
	}
}

prevstate = state; 

switch(state){	
	case CHAR_STATE.selected:
		if(!checkHeld("slow")){
			dx = checkHeld("right") - checkHeld("left"); 
			dy = checkHeld("down") - checkHeld("up");
			var m = max(1,point_distance(0, 0, sign(dx), sign(dy)))
			dx /= m
			dy /= m
	
			x += dx * moveSpeed * slowfactor * ((room == roomPathRecord)? 1/4 : 1);
			y += dy * moveSpeed * slowfactor * ((room == roomPathRecord)? 1/4 : 1);			
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
			state = CHAR_STATE.unselected;	
		}
		break;
}


var safetynet = instance_place(x,y,oSafetyNet)
if(safetynet != noone && safetynet.state == SAFETY_STATE.empty){
	audio_play_sound(soundSafetyNet,1,false);
	state = CHAR_STATE.safe;
	safetynet.state = SAFETY_STATE.caught;
	safetynet.char = id;
	SwitchCharacter();
}