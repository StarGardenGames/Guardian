if(is_sprite){
	draw_sprite_ext(sprs[index], 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
}else{
	draw_set_font(fBigFont)
	draw_set_halign(fa_center)
	draw_set_valign(fa_bottom)
	draw_set_color(c_white)
	draw_text(x, y, abc[index])
}