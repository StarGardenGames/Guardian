/// @desc Draws an arc from theta1 to theta2 (counter clockwise)
/// @param x x at center of arc
/// @param y y at center of arc
/// @param radius radius of arc
/// @param theta1 start of arc
/// @param theta2 end of arc
/// @param [outline_width] width of outline (0 to be filled)
/// @param [segment_count] number of segments (defaults to 8, that's usually plenty)

var center_x = argument[0]
var center_y = argument[1]
var radius = argument[2]
var theta1 = argument[3]
var theta2 = argument[4]
var outline_width = (argument_count >= 6)? argument[5] : 0;
var seg_count = (argument_count >= 7)? argument[6] : 8;

if(outline_width == 0){
	while(theta2 < theta1) theta2 += 360
	var dtheta = (theta2 - theta1) / seg_count;

	var prev_x = center_x + lengthdir_x(radius, theta1)
	var prev_y = center_y + lengthdir_y(radius, theta1)
	
	for(var i = 1; i <= seg_count; i++){
		var next_x = center_x + lengthdir_x(radius, theta1+dtheta*i)
		var next_y = center_y + lengthdir_y(radius, theta1+dtheta*i)
	
		draw_triangle(center_x, center_y, prev_x, prev_y, next_x, next_y, false)
	
		prev_x = next_x
		prev_y = next_y
	}
}else{
	drawArc(center_x, center_y, radius, theta1, theta2, outline_width)
	drawWideLine(
		center_x, center_y,
		center_x+lengthdir_x(radius, theta1), center_y+lengthdir_y(radius, theta1), 
		outline_width
	)
	drawWideLine(
		center_x, center_y,
		center_x+lengthdir_x(radius, theta2), center_y+lengthdir_y(radius, theta2), 
		outline_width
	)
}