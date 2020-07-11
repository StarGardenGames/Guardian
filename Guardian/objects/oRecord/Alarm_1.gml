/// @description Disable Recording
recording = false;
for(var i = 0; i < ds_list_size(xs); i++){
	path_add_point(path,xs[|i],ys[|i],200)
}

room_goto(room0);
