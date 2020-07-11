/// @desc Returns the color that would be drawn if blend was applied to it
/// @param {color} color
/// @param {color} blend
// Examples
// makeColorGray(c_white, c_grey) -> c_grey
// makeColorGray(c_red, c_grey) -> some dark red

var color = argument0;
var blend = argument1;

return make_color_rgb(
	255 * ( (color_get_red(color)/255) * (color_get_red(blend)/255) ),
	255 * ( (color_get_green(color)/255) * (color_get_green(blend)/255) ),
	255 * ( (color_get_blue(color)/255) * (color_get_blue(blend)/255) ),
);