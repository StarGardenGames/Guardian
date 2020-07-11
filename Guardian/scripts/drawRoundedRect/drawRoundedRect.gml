/// @desc Draws a rectangle with rounded corners
/// @param x1 x of first corner
/// @param y1 y of first corner
/// @param x2 x of second corner
/// @param y2 y of second corner
/// @param corner_radius corner radius
/// @param [outline_width] width of outline

var x1 = argument[0];
var y1 = argument[1];
var x2 = argument[2];
var y2 = argument[3];
var r = argument[4];
var outline_width = (argument_count >= 6)? argument[5] : 0;

drawWideLine(
	x1, (y1 + y2)/2,
	x2, (y1 + y2)/2,
	max(y1, y2) - min(y1, y2),
	outline_width,
	r
)