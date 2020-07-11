/// @desc Adds a anchoroed object to the screen
/// @param x1 left side of gui region
/// @param y1 top of gui region
/// @param [obj] specific object which inherits from oInputClickable (by default it just uses oInputClickable
/// @param [anchor] ANCHOR enum representing whether the positions should be relative 
///                               to a certain part of the screen (by default it's (0,0) )
/// @param [anchor_obj] object to anchor to (only useful if you're using ANCHOR.object or ANCHOR.screen_object)

var x1 = argument[0];
var y1 = argument[1];
var obj = (argument_count >= 3)? argument[2] : oAnchoredObject;
var anchor = (argument_count >= 4)? argument[3] : ANCHOR.none;
var anchor_obj = (argument_count >= 5)? argument[4] : undefined;

var anchor_x = anchorX(anchor, anchor_obj)
var anchor_y = anchorY(anchor, anchor_obj)

with(instance_create_layer(
	anchor_x + x1,
	anchor_y + y1, 
	layer,
	obj
)){
	self.anchor = anchor
	self.anchor_obj = anchor_obj
	
	self.x1 = x1;
	self.y1 = y1;

	return id;
}