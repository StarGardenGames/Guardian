event_inherited()

//oInput performs most of the logic for us in begin step
// inputClickableUpdateState() // easy f1

if(script != noone && (released || checkReleased(input_name))){
	scriptExecuteWithArrayArgs(script, script_args)
}

// respond to anchor updates (if we have an anchor)
if(anchor != ANCHOR.none){
	// TODO: update this to consider situations where ther's no sprite
	// this assumes that x1/x2, y1/y2 are already calibrated to align with sprite_xoffset and sprite_yoffset
	if(sprite_index == -1){
		x = (inputClickableX1() + inputClickableX2()) / 2
		y = (inputClickableY1() + inputClickableY2()) / 2
	}else{
		x = inputClickableX1() + sprite_xoffset
		y = inputClickableY1() + sprite_yoffset
	}
}