if(state == RECORD_STATE.record){
	ds_list_add(record[? "xs"], round(oCharacter.x));
	ds_list_add(record[? "ys"], round(oCharacter.y));
}

layer_set_visible(selectors_layer, state==RECORD_STATE.selection)