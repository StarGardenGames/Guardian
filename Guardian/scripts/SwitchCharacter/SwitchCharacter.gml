//Characters are assigned randomly to elements of chararr
if(checkPressed("swap")){
	with(chararr[index]){
		if(state != CHAR_STATE.safe){
			state = CHAR_STATE.unselected;
			if(object_is_ancestor(object_index, oCharacterPath)){
				path_start(path,moveSpeed,path_action_continue,false);
			}
			if(object_index == oCharacterCustom){
				base_x = x - (oPersistent.my_xs[| floor(pos_index) % ds_list_size(oPersistent.my_xs)] - oPersistent.my_xs[|0])
				base_y = y - (oPersistent.my_ys[| floor(pos_index) % ds_list_size(oPersistent.my_ys)] - oPersistent.my_ys[|0])
			}
		}
	}	
	index++; 	
	if(index > array_length_1d(chararr) - 1){
		index = 0; 	
	}
	with(chararr[index]){
		if(state != CHAR_STATE.safe){
			state = CHAR_STATE.selected;
			if(object_is_ancestor(object_index, oCharacterPath)){
				path_end();
			}
		}
	}
}