event_inherited();

base_col = c_white
var sc = (hover)? 1.2 : 1

// level select
if(is_real(text)){
	if(ds_map_exists(oPersistent.levels_won, string(real(text)-1)) and oPersistent.levels_won[? string(real(text)-1) ]){
		base_col = c_green
		draw_set_color(c_green)
		draw_circle(
			(inputClickableX1()+inputClickableX2())/2,
			(inputClickableY1()+inputClickableY2())/2, 30*sc, true)
	}
}

draw_set_font(fBigFont)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_set_color((interactable)? base_col: c_gray)
draw_text_transformed(
	(inputClickableX1()+inputClickableX2())/2,
	(inputClickableY1()+inputClickableY2())/2, 
	text,
	sc,
	sc,
	0
)