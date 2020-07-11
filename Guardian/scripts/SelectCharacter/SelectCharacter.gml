var numChars = instance_number(oCharacter);

index = irandom(numChars-1);

for(var i = 0; i < numChars; i++){
	chararr[i] = instance_find(oCharacter, i);
}

if(numChars == 1 && chararr[0].state == CHAR_STATE.safe) exit; 

with(chararr[index]){
	if(state != CHAR_STATE.safe){
		path_end();
		state = CHAR_STATE.selected;
	}else{
		SelectCharacter();
	}
}