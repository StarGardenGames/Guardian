/// @desc Checks if a position is inside the view
/// @param x x value to check
/// @param y y value to check
/// @param [is_gui_pos] (optional) should x,y by considered a gui position?
/// @param [margin] (optional) valid margin around view

var xx = argument[0];
var yy = argument[1];
var is_gui_pos = (argument_count == 3)? argument[2] : false;
var margin = (argument_count == 4)? argument[3] : 0;

if(is_gui_pos){
	return -margin < xx && xx < camW() + margin && -margin < yy && yy < camH() + margin;
}else{
	return camL()-margin < xx && xx < camR()+margin && camT()-margin < yy && yy < camB()+margin;
}