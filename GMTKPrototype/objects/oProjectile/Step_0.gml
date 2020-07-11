event_inherited();

switch(dir){
	case "right":
		x += moveSpeed*slowfactor; 
	break;
	case "up":
		y -= moveSpeed*slowfactor;
	break;
	case "left":
		x -= moveSpeed*slowfactor; 
	break;
	case "down":
		y += moveSpeed*slowfactor;
	break;
}
if(x > room_width || x < -sprite_width || y > room_height || y < -sprite_height){
	instance_destroy();
}