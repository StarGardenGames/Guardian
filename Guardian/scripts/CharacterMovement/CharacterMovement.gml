if(selected && !keyboard_check(vk_space)){
	
	dx = checkHeld("right") - checkHeld("left"); 
	dy = checkHeld("down") - checkHeld("up");
	var m = max(1,point_distance(0, 0, sign(dx), sign(dy)))
	dx /= m
	dy /= m
	
	x += dx * moveSpeed * slowfactor;
	y += dy * moveSpeed * slowfactor;
}