draw_self()
draw_set_color(c_yellow)
if(state == CHAR_STATE.selected){
	draw_rectangle(x-sprite_width/2, y-sprite_height, x+sprite_width/2, y, true)
}