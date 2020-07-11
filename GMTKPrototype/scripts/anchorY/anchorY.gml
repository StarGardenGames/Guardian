/// @desc This gives the yoffset corresponding to the screen offset
/// @param anchor SCREEN_ANCHOR point to check
/// @param [height] the height of the screen 

var anchor = argument[0]
var anchor_obj = (argument_count > 1)? argument[1] : undefined
// giving the option to pass the width to support oInputScreenSpace use case
var screen_height = (argument_count > 2)? argument[2] : display_get_gui_height()

switch(anchor){
case ANCHOR.none:
case ANCHOR.screen_top_left:
case ANCHOR.screen_top:
case ANCHOR.screen_top_right:
	return 0;
case ANCHOR.screen_left:
case ANCHOR.screen_center:
case ANCHOR.screen_right:
	return screen_height/2;
case ANCHOR.screen_bottom_left:
case ANCHOR.screen_bottom:
case ANCHOR.screen_bottom_right:
	return screen_height/2;
case ANCHOR.object:
case ANCHOR.screen_object:
	if(anchor_obj = undefined) throwError("anchor_obj is required if anchor is ANCHOR.object")
	if(!instance_exists(anchor_obj)) throwError("couldn't find instance for ", object_get_name(anchor_obj))
	return anchor_obj.y
}