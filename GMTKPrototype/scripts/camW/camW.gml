/// @desc Returns width of camera, and sets first if given
/// @param [width] (Optional) new width
// Because Game Maker's view functions take too long to write :'(

if(argument_count == 1){
	var ww = argument[0];
	camSize(ww, camH());
}

if(view_enabled){
	return camera_get_view_width(view_camera[0]);
}else{
	return room_width
}