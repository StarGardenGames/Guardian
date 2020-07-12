if(checkHeld("slow")){
	slowfactor = lerp(slowfactor,1/30,0.08);
}else{
	slowfactor = lerp(slowfactor,1,0.08);
	if(slowfactor > 0.8) slowfactor = 1;
}



