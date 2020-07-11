if(checkHeld("slow")){
	slowfactor = lerp(slowfactor,1/30,0.08);
}else{
	slowfactor = lerp(slowfactor,1,0.08);
	if(slowfactor > 0.8) slowfactor = 1;
}

if(point_distance(xprev,yprev,x,y) > 0){
	image_speed = 1*slowfactor
	with(oProjectile){
		image_speed = moveSpeed*slowfactor/6 + 1/3	
	}
}else{
	image_speed = 0
	image_index = 0
}

xprev = x
yprev = y