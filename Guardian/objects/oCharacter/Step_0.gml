event_inherited();

CharacterMovement();
CharacterDeath();

// xprevious doesn't work for paths :'(
if((x-xprev) != 0){
	image_xscale = start_scale*sign(x-xprev)
	image_speed = 1
}else{
	image_speed = 0
	image_index = 0
}

xprev = x