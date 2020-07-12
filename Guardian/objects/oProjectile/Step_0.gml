event_inherited();
image_speed = moveSpeed*slowfactor/6 + 1/3	
switch(dir){
	case "right":
		image_angle = 0;
		x += moveSpeed*slowfactor; 
	break;
	case "up":
		image_angle = 90;
		y -= moveSpeed*slowfactor;
	break;
	case "left":
		image_angle = 180;
		x -= moveSpeed*slowfactor; 
	break;
	case "down":
		image_angle = 270;
		y += moveSpeed*slowfactor;
	break;
}
if(x > room_width + 150 || x < -150 || y > room_height + 150 || y < -150){
	instance_destroy();
}