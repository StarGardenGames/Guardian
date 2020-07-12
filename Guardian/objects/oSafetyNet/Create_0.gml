enum SAFETY_STATE{
	caught,
	empty,
	release,
}

state = SAFETY_STATE.empty; 
depth = 1; 
char = noone; 

if(place_meeting(x,y,oWall)) instance_destroy();