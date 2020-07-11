enum RECORD_STATE{
	selection,
	pre,
	record,
	post,
}

state = RECORD_STATE.selection

recording = false;

//alarm[0] = 90;

with(oCharacter){
	state = CHAR_STATE.selected;
}

with(oCharacterPath){
	path_end();	
}

xs = ds_list_create()
ys = ds_list_create()

selectors_layer = layer_get_id("Selectors")

sprite = sCharacterLeft
name = "aaaaa"
