event_inherited();

if(ds_list_size(oPersistent.xs) == 0) exit

if(state == CHAR_STATE.unselected){
	pos_index += slowfactor
	
	if(pos_index >= ds_list_size(oPersistent.xs)){
		pos_index -= ds_list_size(oPersistent.xs)
		base_x = x
		base_y = y
	}
	
	x = base_x + oPersistent.xs[| floor(pos_index) % ds_list_size(oPersistent.xs)] - oPersistent.xs[|0]
	y = base_y + oPersistent.ys[| floor(pos_index) % ds_list_size(oPersistent.ys)] - oPersistent.ys[|0]
}


