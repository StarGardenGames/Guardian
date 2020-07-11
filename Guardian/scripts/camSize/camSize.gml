/// @desc Returns camera size as [w,h], sets position if given
/// @param [width] (optional) new width
/// @param [height] (optional) new height
// Because Game Maker's view functions take too long to write :'(

if(argument_count == 2){
	var ww = argument[0];
	var hh = argument[1];
	camera_set_view_size(view_camera[0], ww, hh);
}

return [camW(), camH()];