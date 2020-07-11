/// @desc Returns camera position as [x,y], sets position if given
/// @param [x] (optional) new x
/// @param [y] (optional) new y
// Because Game Maker's view functions take too long to write :'(

if(argument_count == 2){
	var xx = argument[0];
	var yy = argument[1];
	camera_set_view_pos(view_camera[0], xx, yy);
}

return [camX(), camY()];