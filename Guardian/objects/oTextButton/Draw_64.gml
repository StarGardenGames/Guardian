event_inherited();

var sc = (hover)? 1.2 : 1

draw_set_font(fBigFont)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_text_transformed(
	(inputClickableX1()+inputClickableX2())/2,
	(inputClickableY1()+inputClickableY2())/2, 
	text,
	sc,
	sc,
	0
)