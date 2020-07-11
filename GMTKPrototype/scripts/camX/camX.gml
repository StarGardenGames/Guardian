/// @desc Returns x position of camera, and sets first if given
/// @param [x] (optional) new x
// Because Game Maker's view functions take too long to write :'(

if(argument_count == 1){
	var xx = argument[0];
	camPos(xx, camY());
}

return camera_get_view_x(view_camera[0]);