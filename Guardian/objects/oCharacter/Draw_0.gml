draw_self()

/*if(death_ring){
	draw_set_color(c_black)
	draw_circle(x, y, death_radius, true)
}*/

if(state == CHAR_STATE.selected){
	draw_set_color(c_yellow)
	draw_rectangle(x-sprite_width/2, y-sprite_height, x+sprite_width/2, y, true)
}