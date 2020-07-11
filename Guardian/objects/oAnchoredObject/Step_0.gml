x = inputClickableX1() // technically I should replace the function for anchored object, but I don't want to
y = inputClickableY1() // ^^^^


// remove itemInArray for performance, https://trello.com/c/lP01YnHm/320-optimization
if(anchor == ANCHOR.object or anchor == ANCHOR.screen_object){
	image_xscale = local_image_xscale * anchorXScale(anchor, anchor_obj)
	image_yscale = local_image_yscale * anchorYScale(anchor, anchor_obj)
}