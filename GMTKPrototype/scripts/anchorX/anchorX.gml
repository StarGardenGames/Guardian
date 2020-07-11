/// @desc This gives the xoffset corresponding to the screen offset
/// @param anchor ANCHOR point to check
/// @param [anchor_obj] object to be used if anchored to an object
/// @param [width] the width of the screen 

var anchor = argument[0]
var anchor_obj = (argument_count > 1)? argument[1] : undefined
// giving the option to pass the width to support oInputScreenSpace use case
var screen_width = (argument_count > 2)? argument[2] : display_get_gui_width()

switch(anchor){
case ANCHOR.none:
case ANCHOR.screen_top_left:
case ANCHOR.screen_left:
case ANCHOR.screen_bottom_left:
	return 0;
case ANCHOR.screen_top:
case ANCHOR.screen_center:
case ANCHOR.screen_bottom:
	return screen_width/2;
case ANCHOR.screen_top_right:
case ANCHOR.screen_right:
case ANCHOR.screen_bottom_right:
	return screen_width;
case ANCHOR.object:
case ANCHOR.screen_object:
	if(anchor_obj = undefined) throwError("anchor_obj is required if anchor is ANCHOR.object or ANCHOR.screen_object")
	if(!instance_exists(anchor_obj)) throwError("couldn't find instance for ", object_get_name(anchor_obj))
	return anchor_obj.x
}