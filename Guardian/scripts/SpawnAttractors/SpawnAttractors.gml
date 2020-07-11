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

if(irandom(300) != 1) exit; 
if(instance_number(oAttractor) == 0){
	instance_create_depth(irandom(1280),irandom(720),-1,oAttractor)
}