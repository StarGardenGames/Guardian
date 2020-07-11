// NOTE: the layer was specifically chosen so that this overlay would work
// under different circumstances I would probably have a separate object for the overlay
if(draw_overlay){
	draw_set_alpha(.7)
	draw_set_color(make_color_rgb(54, 70, 156)) // SGG brand blue
	draw_rectangle(camL(), camT(), camR(), camB(), false);
	draw_set_alpha(1)
}