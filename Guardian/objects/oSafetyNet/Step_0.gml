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
		if(image_index <= 0) instance_destroy();
		break;
}

if(place_meeting(x,y,oProjectile) || place_meeting(x,y,oWall)) alarm_set(0,alarm_get(0) + 1) 