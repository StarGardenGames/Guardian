enum RECORD_STATE{
	selection,
	pre,
	record,
	post,
}

state = RECORD_STATE.selection

with(oCharacterPath){
	path_end();	
}

record = oPersistent.my_record;

selectors_layer = layer_get_id("Selectors")