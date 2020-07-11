recording = false;

alarm[0] = 90;

with(oCharacter){
	state = CHAR_STATE.selected;

}

with(oCharacterPath){
	path_end();	
}

xs = ds_list_create()
ys = ds_list_create()