if(oControl.level_state != LEVEL_STATE_2.live or checkHeld("slow")){
	slowfactor = lerp(slowfactor,1/30,0.08);
}else{
	slowfactor = lerp(slowfactor,1,0.08);
	if(slowfactor > 0.8) slowfactor = 1;
}



