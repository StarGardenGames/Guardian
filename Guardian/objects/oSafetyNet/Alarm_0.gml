with(char){
	visible = true; 
	if(instance_number(oCharacter) > 1){
		state = CHAR_STATE.unselected; 
		path_start(path,moveSpeed,path_action_continue,false);
	}else{
		state = CHAR_STATE.selected;	
	}
}
instance_destroy(); 
