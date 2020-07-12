var numChars = instance_number(oCharacter);
var safestates = 0; 

for(var i = 0; i < numChars; i++){
	if(instance_find(oCharacter,i).state == CHAR_STATE.safe) safestates++;
}

with(char){
	visible = true; 
	if(numChars == safestates){		
		oControl.index = index;  
	}else{
		state = CHAR_STATE.unselected; 
	}
}

state = SAFETY_STATE.release;