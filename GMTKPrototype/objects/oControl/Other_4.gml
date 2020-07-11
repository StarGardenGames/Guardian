index = irandom(instance_number(oCharacter)-1);

for(var i = 0; i < instance_number(oCharacter); i++){
	chararr[i] = instance_find(oCharacter, i);
}

with(chararr[index]){
	selected = true; 	
}