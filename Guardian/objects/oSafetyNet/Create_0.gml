enum SAFETY_STATE{
	caught,
	empty,
	decay,
	release,
}

image_speed = 0; 

state = SAFETY_STATE.empty; 
depth = 1; 
char = noone; 

if(place_meeting(x,y,all)) instance_destroy();