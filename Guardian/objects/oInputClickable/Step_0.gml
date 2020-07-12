event_inherited()

//oInput performs most of the logic for us in begin step
// inputClickableUpdateState() // easy f1

if(script != noone && (released || checkReleased(input_name))){
	scriptExecuteWithArrayArgs(script, script_args)
	audio_play_sound(soundUI,1,false)
}

// respond to anchor updates (if we have an anchor)
if(anchor != ANCHOR.none){
	// TODO: update this to consider situations where ther's no sprite
	// this assumes that x1/x2, y1/y2 are already calibrated to align with sprite_xoffset and sprite_yoffset
	if(sprite_index == -1){
		x = (inputClickableX1() + inputClickableX2()) / 2
		y = (inputClickableY1() + inputClickableY2()) / 2
	}else{
		x = ((image_xscale > 0)? inputClickableX1() : inputClickableX2()) + sprite_xoffset
		y = ((image_yscale > 0)? inputClickableY1() : inputClickableY2()) + sprite_yoffset
	}
}