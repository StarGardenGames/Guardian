var anchor = argument[0]
var anchor_obj = argument[1]

// removed itemInArray for performance, https://trello.com/c/lP01YnHm/320-optimization
if(anchor == ANCHOR.object or anchor == ANCHOR.screen_object){
	return anchor_obj.image_yscale
}else{
	return 1
}