// demo using cam functions
var margin = 100;
var max_pan_speed = 16;
var mouse_on_screen = camX() < mouse_x && mouse_x < camX() + camW() && 
					  camY() < mouse_y && mouse_y < camY() + camH();
if(mouse_on_screen){
	var cam_mouse_x = mouse_x - camX()
	
	var left_margin = margin;
	if(cam_mouse_x < left_margin){
		var sp = max_pan_speed * (left_margin - cam_mouse_x) / margin
		camX(max(0, camX()-sp));	
	}

	var right_margin = camW() - margin
	if(cam_mouse_x > right_margin){
		var sp = max_pan_speed * (cam_mouse_x - right_margin) / margin
		camX(min(max_cam_x, camX()+sp));	
	}
}

path_pos = (path_pos + .001) % 1