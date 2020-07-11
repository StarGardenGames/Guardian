/// @desc Returns width of camera, and sets first if given
/// @param [height] (Optional) new height
// Because Game Maker's view functions take too long to write :'(

if(argument_count == 1){
	var hh = argument[0];
	camSize(camW(), hh);
}

if(view_enabled){
	return camera_get_view_height(view_camera[0]);
}else{
	return room_height;
}