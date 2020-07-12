var numChars = instance_number(oCharacter);
var safestates = 0; 

for(var i = 0; i < numChars; i++){
	if(instance_find(oCharacter,i).state == CHAR_STATE.safe) safestates++;
}

with(char){
	visible = true; 
	if(numChars == safestates){		
		state = CHAR_STATE.selected;
	}else{
		state = CHAR_STATE.unselected; 
		path_start(path,moveSpeed,path_action_continue,false);	
	}
}
instance_destroy(); 
