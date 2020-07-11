/// @desc Adds a clickable region to the screen
/// @param input_name input to assign to the region (it's can be convenient to use vk_* keys but strings are also possible)
/// @param x1 left side of gui region
/// @param y1 top of gui region
/// @param x2 right side of gui region
/// @param y2 bottom of gui region
/// @param [obj] specific object which inherits from oInputClickable (by default it just uses oInputClickable
/// @param [anchor] ANCHOR enum representing whether the positions should be relative 
///                               to a certain part of the screen (by default it's (0,0) )
/// @param [anchor_obj] object to anchor to (only useful if you're using ANCHOR.object or ANCHOR.screen_object)

var input_name = argument[0];

var x1 = min(argument[1], argument[3]);
var y1 = min(argument[2], argument[4]);
var x2 = max(argument[1], argument[3]);
var y2 = max(argument[2], argument[4]);
var obj = (argument_count >= 6)? argument[5] : oInputClickable;
var anchor = (argument_count >= 7)? argument[6] : ANCHOR.none;
var anchor_obj = (argument_count == 8)? argument[7] : undefined;

inputAddInputName(input_name)

var anchor_x = anchorX(anchor, anchor_obj)
var anchor_y = anchorY(anchor, anchor_obj)

with(instance_create_layer(
	anchor_x + (x1+x2)/2,
	anchor_y + (y1+y2)/2, 
	layer,
	obj
)){
	self.input_name = input_name;
	
	self.anchor = anchor
	self.anchor_obj = anchor_obj
	
	self.x1 = x1;
	self.y1 = y1;
	self.x2 = x2;
	self.y2 = y2;

	return id;
}