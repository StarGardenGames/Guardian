if(level_state == LEVEL_STATE_2.won){
	for(var i = 0; i < array_length_1d(oPersistent.levels); i++){
		if(oPersistent.levels[i] == room){
			oPersistent.levels_won[? string(i) ] = true	
		}
	}
}

if(room == oPersistent.levels[0] and level_state == LEVEL_STATE_2.won){
	room_goto(roomPathRecord)	
}else{
	room_goto(rm_menu)
}