//Characters are assigned randomly to elements of chararr
if(keyboard_check_pressed(vk_tab)){
	with(chararr[index]){
		selected = false;
		if(object_is_ancestor(object_index, oCharacterPath)){
			path_start(path,moveSpeed,path_action_continue,false);
		}
		if(object_index == oCharacterCustom){
			base_x = x - (oPersistent.xs[| floor(pos_index) % ds_list_size(oPersistent.xs)] - oPersistent.xs[|0])
			base_y = y - (oPersistent.ys[| floor(pos_index) % ds_list_size(oPersistent.ys)] - oPersistent.ys[|0])
		}
	}	
	index++; 	
	if(index > array_length_1d(chararr) - 1){
		index = 0; 	
	}
	with(chararr[index]){
		selected = true;
		if(object_is_ancestor(object_index, oCharacterPath)){
			path_end();
		}
	}
}