var anchor_x = anchorX(
	anchor, 
	anchor_obj,
	(instance_exists(oInputScreenSpace))? oInputScreenSpace.sprite_width : display_get_gui_width()
)
var anchor_y = anchorY(
	anchor, 
	anchor_obj,
	(instance_exists(oInputScreenSpace))? oInputScreenSpace.sprite_height : display_get_gui_height()
)

x1 = x - anchor_x
y1 = y - anchor_y

if(itemInArray(anchor, [ANCHOR.object, ANCHOR.screen_object])){
	x1 /= anchor_obj.image_xscale
	y1 /= anchor_obj.image_yscale
}

local_image_xscale = image_xscale / anchorXScale(anchor, anchor_obj)
local_image_yscale = image_yscale / anchorYScale(anchor, anchor_obj)