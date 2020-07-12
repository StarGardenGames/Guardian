switch(state){
	case SAFETY_STATE.caught: 	
		if(image_index <= image_number - 1){
			image_speed = 1
			char.visible = false
		}else if(image_index > image_number - 1){
			image_speed = 0
			image_index = image_number - 1 
			alarm[0] = 150;
			state = SAFETY_STATE.decay		
		}
		break;
	case SAFETY_STATE.release:
		image_speed = -1; 
		if(image_index <= 0){
			instance_destroy();
		}
		break;
}
var dt = 0;
if(place_meeting(x,y,oProjectile) || place_meeting(x,y,oWall)){
	with(oWall){
		if(state != WALL_STATE.inactive) dt = 1;
	}
	alarm_set(0,alarm_get(0) + dt)
}