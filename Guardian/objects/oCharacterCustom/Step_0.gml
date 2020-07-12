event_inherited();

sprite_index = sprs[ record[? "type"] ]

var xs = record[? "xs" ]
var ys = record[? "ys" ]

if(ds_list_size(xs) == 0) exit

if(state == CHAR_STATE.unselected){
	pos_index += slowfactor
	
	if(pos_index >= ds_list_size(xs)){
		pos_index -= ds_list_size(xs)
		base_x = x
		base_y = y
	}
	

	x = base_x + xs[| floor(pos_index) % ds_list_size(xs)] - xs[|0]
	y = base_y + ys[| floor(pos_index) % ds_list_size(ys)] - ys[|0]
}


