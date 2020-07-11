if(selected && !keyboard_check(vk_space)){
	
	dx = keyboard_check(vk_right) - keyboard_check(vk_left); 
	dy = keyboard_check(vk_down) - keyboard_check(vk_up);

	x += dx * moveSpeed * slowfactor;
	y += dy * moveSpeed * slowfactor; 
	
}else if(!selected){
	path_speed = slowfactor * moveSpeed / 4;
}