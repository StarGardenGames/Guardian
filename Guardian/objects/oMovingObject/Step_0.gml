if(keyboard_check(vk_space)){
	slowfactor = lerp(slowfactor,1/30,0.08);
}else{
	slowfactor = lerp(slowfactor,1,0.08);
	if(slowfactor > 0.8) slowfactor = 1;
}

// xprevious doesn't work for paths :'(
if((x-xprev) != 0){
	image_xscale = start_scale*sign(x-xprev)
}

if(point_distance(xprev,yprev,x,y) > 0){
	image_speed = 1*slowfactor
}else{
	image_speed = 0
	image_index = 0
}

xprev = x
yprev = y