/// @desc Draws a rectangle outline with variable with
/// @param x1 x of first corner
/// @param y1 y of first corner
/// @param x2 x of second corner
/// @param y2 y of second corner
/// @param [width] width of the "rectangle"
/// @param [outline_width] width of outline, or 0 if it should be filled
/// @param [corner_radius] radius of the corner

var x1 = argument[0];
var y1 = argument[1];
var x2 = argument[2];
var y2 = argument[3];
var width = (argument_count >= 5)? argument[4] : 1
var outline_width = (argument_count >= 6)? argument[5] : 0
var corner_radius = (argument_count >= 7)? argument[6] : 0

var length = point_distance(x1, y1, x2, y2)

if(corner_radius > width / 2 || corner_radius > length/2){
	throwError("Corner radius, must be less than half the side lengths")	
}

var line_dir = point_direction(x1, y1, x2, y2)

var offset_x = lengthdir_x(width/2, line_dir+90)
var offset_y = lengthdir_y(width/2, line_dir+90)

if(corner_radius == 0){
	var coords = [
		x1 + offset_x,  y1 + offset_y,
		x1 - offset_x,  y1 - offset_y,
		x2 - offset_x,  y2 - offset_y,
		x2 + offset_x,  y2 + offset_y,
	]
	// funadmental logic to draw a angled filled rectangle
	if(outline_width == 0){
		draw_triangle(coords[0], coords[1], coords[2], coords[3], coords[4], coords[5], false);
		draw_triangle(coords[0], coords[1], coords[6], coords[7], coords[4], coords[5], false);
	// rotated rectangle outline
	}else{
		// note I'm passing in outline width as the width for the outline
		var padding_x = lengthdir_x(outline_width/2, line_dir+90)
		var padding_y = lengthdir_y(outline_width/2, line_dir+90)
		drawWideLine(coords[0]+padding_x, coords[1]+padding_y, 
					 coords[2]-padding_x, coords[3]-padding_y, outline_width)
		drawWideLine(coords[4], coords[5], coords[2], coords[3], outline_width)
		drawWideLine(coords[4]-padding_x, coords[5]-padding_y, 
					 coords[6]+padding_x, coords[7]+padding_y, outline_width)
		drawWideLine(coords[0], coords[1], coords[6], coords[7], outline_width)
	}
}else{
	var t = corner_radius / length;
	var inner_offset_x = lengthdir_x((width/2)-corner_radius, line_dir+90)
	var inner_offset_y = lengthdir_y((width/2)-corner_radius, line_dir+90)
	var inner_x1 = lerp(x1, x2, t);
	var inner_y1 = lerp(y1, y2, t);
	var inner_x2 = lerp(x1, x2, 1-t);
	var inner_y2 = lerp(y1, y2, 1-t);
	var in_coords = [
		inner_x1+inner_offset_x, inner_y1+inner_offset_y,
		inner_x1-inner_offset_x, inner_y1-inner_offset_y,
		inner_x2-inner_offset_x, inner_y2-inner_offset_y,
		inner_x2+inner_offset_x, inner_y2+inner_offset_y, 
	]	
	
	// rotated filled rounded rect
	if(outline_width == 0){
		drawWideLine(x1, y1, x2, y2, width - (corner_radius*2), 0, 0)
		drawWideLine(inner_x1, inner_y1, inner_x2, inner_y2, width, 0, 0)
	
		drawSlice(in_coords[0], in_coords[1], corner_radius, line_dir+90, line_dir+180, outline_width)
		drawSlice(in_coords[2], in_coords[3], corner_radius, line_dir+180, line_dir+270, outline_width)
		drawSlice(in_coords[4], in_coords[5], corner_radius, line_dir+270, line_dir, outline_width)
		drawSlice(in_coords[6], in_coords[7], corner_radius, line_dir, line_dir+90, outline_width)
	// rotated outlined rounded rect
	}else{
		drawWideLine(inner_x1+offset_x, inner_y1+offset_y, inner_x2+offset_x, inner_y2+offset_y, outline_width)
		drawWideLine(inner_x1-offset_x, inner_y1-offset_y, inner_x2-offset_x, inner_y2-offset_y, outline_width)
		drawWideLine(x1-inner_offset_x, y1-inner_offset_y, x1+inner_offset_x, y1+inner_offset_y, outline_width)
		drawWideLine(x2-inner_offset_x, y2-inner_offset_y, x2+inner_offset_x, y2+inner_offset_y, outline_width)
		
		drawArc(in_coords[0], in_coords[1], corner_radius, line_dir+90, line_dir+180, outline_width)
		drawArc(in_coords[2], in_coords[3], corner_radius, line_dir+180, line_dir+270, outline_width)
		drawArc(in_coords[4], in_coords[5], corner_radius, line_dir+270, line_dir, outline_width)
		drawArc(in_coords[6], in_coords[7], corner_radius, line_dir, line_dir+90, outline_width)
	}
}