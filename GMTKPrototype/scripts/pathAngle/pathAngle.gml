/// @desc Returns the angle of a path at a particular position
/// @param path path id
/// @param [0,1] postition on path
var path_id = argument0;
var position = argument1;

return point_direction(
	path_get_x(path_id, position-.001),
	path_get_y(path_id, position-.001),
	path_get_x(path_id, position+.001),
	path_get_y(path_id, position+.001),
);

