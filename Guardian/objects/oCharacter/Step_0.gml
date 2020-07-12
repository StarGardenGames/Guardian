event_inherited();

if(index == oControl.index) state = CHAR_STATE.selected; 
if(state == CHAR_STATE.selected && oControl.index != index) state = CHAR_STATE.unselected;

if(death_ring){
	if(image_index + image_speed >= image_number-1){
		image_index = image_number -1
		image_speed = 0
	}
	if(image_index == image_number-1){
		death_radius = lerp(death_radius, 64, .05)	
	}
	exit
}

CharacterMovement();
CharacterDeath();

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

