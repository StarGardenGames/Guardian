index = irandom(instance_number(oCharacter)-1);

for(var i = 0; i < instance_number(oCharacter); i++){
	chararr[i] = instance_find(oCharacter, i);
}

with(chararr[index]){
	if(state != CHAR_STATE.safe){
		path_end();
		state = CHAR_STATE.selected;
	}else{
		SelectCharacter();
	}
}