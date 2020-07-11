/// @desc Returns y position of camera, and sets first if given
/// @param [y] (optional) new y
// Because Game Maker's view functions take too long to write :'(

if(argument_count == 1){
	var yy = argument[0];
	camPos(camX(), yy);
}

return camera_get_view_y(view_camera[0]);