var safecharacters = 0;

for(var i = 0; i < instance_number(oCharacter); i++){
	if(instance_find(oCharacter,i).state == CHAR_STATE.safe) safecharacters++;
}
	
if(safecharacters == instance_number(oCharacter)){
	oControl.index = -1;	
	exit;
}
	
do{ //already handling all characters being safe above
	oControl.index = (oControl.index + 1)%instance_number(oCharacter);	
}until(instance_find(oCharacter,oControl.index).state != CHAR_STATE.safe);
