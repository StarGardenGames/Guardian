//Characters are assigned randomly to elements of chararr
if(keyboard_check_pressed(vk_tab)){
	with(chararr[index]){
			selected = !selected; 
			path_start(path,moveSpeed,path_action_continue,false);
	}	
	index++; 	
	if(index > array_length_1d(chararr) - 1){
		index = 0; 	
	}
	with(chararr[index]){
			selected = !selected; 
			path_end();
	}
}