if(enabled){
	y = lerp(y, ystart, .05)	
}else{
	y = lerp(y, ystart-room_height, .05)	
}

layer_background_alpha(fade_elem, start_alpha*(1-((ystart-y)/room_height)))