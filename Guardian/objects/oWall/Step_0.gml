event_inherited();

image_speed = 1*slowfactor;

switch(state){
	case WALL_STATE.moving_in:
		x = lerp(x,targetx,0.01*slowfactor);
		y = lerp(y,targety,0.01*slowfactor);
		if(point_distance(x,y,targetx,targety) < 2){
			x = targetx;
			y = targety; 
			state = WALL_STATE.extended;
			alarm[0] = 30;
		}
		break;	
	case WALL_STATE.moving_out:
		x = lerp(x,xstart,0.07*slowfactor);
		y = lerp(y,ystart,0.07*slowfactor);
		if(point_distance(x,y,xstart,ystart) < 2){
			x = xstart; 
			y = ystart;
			state = WALL_STATE.inactive;
		}
}