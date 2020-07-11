event_inherited();

moveSpeed = 8;

start_scale = .5

image_xscale = start_scale
image_yscale = start_scale

state = CHAR_STATE.unselected;

enum CHAR_STATE{
	safe,
	unselected,
	selected,
	attracted,	
}