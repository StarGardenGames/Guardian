event_inherited();

switch(dir){
	case "right":
		x += moveSpeed*slowfactor; 
	break;
	case "up":
		image_angle = 90;
		y -= moveSpeed*slowfactor;
	break;
	case "left":
		x -= moveSpeed*slowfactor; 
	break;
	case "down":
		image_angle = 270;
		y += moveSpeed*slowfactor;
	break;
}
if(x > room_width || x < -sprite_width || y > room_height || y < -sprite_height){
	instance_destroy();
}
