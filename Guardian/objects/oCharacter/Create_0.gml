event_inherited();

moveSpeed = 8;

start_scale = .5

image_xscale = start_scale
image_yscale = start_scale

state = CHAR_STATE.unselected;
prevstate = CHAR_STATE.unselected; 

enum CHAR_STATE{
	safe,
	unselected,
	selected,
	attracted,	
}

for(var i = 0; i < instance_number(oCharacter); i++){
	if(instance_find(oCharacter,i) == id){
		index = i; 
		break;
	}
}

start_sprite_index = sprite_index

death_ring = false
death_radius = 300