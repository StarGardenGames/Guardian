draw_self()

/*if(death_ring){
	draw_set_color(c_black)
	draw_circle(x, y, death_radius, true)
}*/

if(state == CHAR_STATE.selected){
	draw_sprite_ext(sSelected, 0, x, y, image_xscale, image_yscale, 0, c_white, 1)
}