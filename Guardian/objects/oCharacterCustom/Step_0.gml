event_inherited();

if(ds_list_size(oPersistent.my_xs) == 0) exit

if(state == CHAR_STATE.unselected){
	pos_index += slowfactor
	
	if(pos_index >= ds_list_size(oPersistent.my_xs)){
		pos_index -= ds_list_size(oPersistent.my_xs)
		base_x = x
		base_y = y
	}
	
	x = base_x + oPersistent.my_xs[| floor(pos_index) % ds_list_size(oPersistent.my_xs)] - oPersistent.my_xs[|0]
	y = base_y + oPersistent.my_ys[| floor(pos_index) % ds_list_size(oPersistent.my_ys)] - oPersistent.my_ys[|0]
}


