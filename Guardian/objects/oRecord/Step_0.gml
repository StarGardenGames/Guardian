if(recording){
	ds_list_add(xs,oCharacter.x);
	ds_list_add(ys,oCharacter.y);
}

layer_set_visible(selectors_layer, state==RECORD_STATE.selection)