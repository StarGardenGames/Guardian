// compute angle
var target_angle;
if(getInputMethod() == INPUT_METHOD.mouse){
	var dist = point_distance(x, y, mouse_x, mouse_y)
	if(dist < sprite_width/2 || inputBlockersExist()){
		sp = 0
		target_angle = image_angle;
	}else{
		sp = max_sp
		target_angle = point_direction(x, y, mouse_x, mouse_y)
	}
}else{
	var dx = checkHeld("right") - checkHeld("left");
	var dy = checkHeld("down") - checkHeld("up")
	if(dx == 0 && dy == 0){
		sp = 0;
		target_angle = image_angle
	}else{
		sp = max_sp
		target_angle = point_direction(0, 0, dx, dy);
	}
}
image_angle = rotateTowards(image_angle, target_angle, turn_speed);

// update position
x += lengthdir_x(sp, image_angle)
y += lengthdir_y(sp, image_angle)

//shooting
if(checkPressed("shoot")){
	addInputBlocker("shooting");
	alarm[0] = 30
	with(instance_create_depth(x, y, depth, oInputBullet)){
		image_angle = other.image_angle;
		direction = other.image_angle;
	}
}
