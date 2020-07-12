draw_set_font(fBigFont)
var padding = string_width("A")*1.5

switch(state){
case RECORD_STATE.record:
	draw_set_color(c_red)
	draw_circle(padding, padding, 10, false)
	draw_set_color(c_white)
	draw_text(padding, padding+string_width("A")*1.5, alarm[1]/room_speed)
	break;
case RECORD_STATE.pre:
	draw_set_color(c_white)
	draw_text(padding, padding, ceil(alarm[0]/room_speed))
	break;
}