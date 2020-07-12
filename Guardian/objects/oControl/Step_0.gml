if(level_state != LEVEL_STATE_2.live){
	input_enabled = false
	if(alarm[0] == -1) alarm[0] = 3*room_speed
}

if(input_enabled){
	if(checkPressed("swap")){
		SwitchCharacter();
	}
}else{
	index = -1	
}
