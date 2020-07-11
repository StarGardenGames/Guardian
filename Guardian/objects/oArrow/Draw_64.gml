event_inherited();

draw_sprite_ext(
	sprite_index,
	0, 
	(inputClickableX1()+inputClickableX2())/2,
	(inputClickableY1()+inputClickableY2())/2,
	image_xscale, 
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
)