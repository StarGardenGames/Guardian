var numChars = instance_number(oCharacter);
var safestates = 0;

//index = irandom(numChars-1);

for(var i = 0; i < numChars; i++){
	chararr[i] = instance_find(oCharacter, i);
	if(chararr[i].state == CHAR_STATE.safe) safestates++;
}

if(numChars == safestates) exit; 

for(var i = 0; i < numChars; i++){
	with(chararr[i]){
		if(state != CHAR_STATE.safe){
			path_end();
			state = CHAR_STATE.selected;
			break;
		}
	}
}

/*with(chararr[index]){
	if(state != CHAR_STATE.safe){
		path_end();
		state = CHAR_STATE.selected;
	}else{
		SelectCharacter();
	}
}*/