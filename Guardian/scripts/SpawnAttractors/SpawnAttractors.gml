if(instance_number(oAttractor) > 0){
	with(oCharacter){
		if(state == CHAR_STATE.unselected){
			state = CHAR_STATE.attracted	
		}
	}
}else{
	with(oCharacter){
		if(state == CHAR_STATE.attracted){
			state = CHAR_STATE.unselected
		}
	}
}

with(oWall) if(state != WALL_STATE.inactive) exit; 
if(irandom(spawnchance) != 1) exit; 

if(instance_number(oAttractor) <= maxattractors){
	instance_create_depth(irandom(1100),irandom(590),-1,oAttractor)
}