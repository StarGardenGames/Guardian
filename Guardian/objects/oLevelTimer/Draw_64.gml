draw_set_font(fBigFont)
var padding = string_width("A")*4

switch(state){
case LEVEL_STATE.play:
	draw_set_color(c_black)
	//draw_text(padding, padding, alarm[2]/room_speed)
	var t = (leveltime == 0)? currenttime : (leveltime-currenttime)
	draw_text(padding, padding, ceil(t * 100)/100)
	break;
}