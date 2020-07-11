if(mouse_type == MOUSE_TYPE.tab){
	// check if our current position is triggering a hover
	var any_hover = false;
	with(oInputClickable){
		if(hover) any_hover = true;
	}
	
	// check if any other mice have moved
	var any_moved = false;
	with(oInputMouse){
		if(mouse_type == MOUSE_TYPE.tab) continue;
		if(moved) any_moved = true;
	}
	
	// start at top in case our current position is no longer valid
	if(!posInView(x, y) || !any_hover || any_moved){
		x = camX()-1;
		y = camY()-1;
	}
}