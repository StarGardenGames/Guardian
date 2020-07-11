if(is_gui){
	draw_set_color(image_blend);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fSGGConsoleBox);
	draw_text(x, y, text);
}