if(!interactable) exit

var alph;
if(held){
	alph = .6;
}else if(hover){
	alph = .4;
}else{
	alph = .2;
}
//draw clickable
draw_set_color(debug_color)
draw_set_alpha(alph)

if(inputClickableIsGUI()){
	if(click_shape_is_ellipse){
		draw_ellipse(
			inputClickableX1(), inputClickableY1(),
			inputClickableX2(), inputClickableY2(), false)
	}else{
		draw_rectangle(
			inputClickableX1(), inputClickableY1(),
			inputClickableX2(), inputClickableY2(), false)
	}
}else{
	if(click_shape_is_ellipse){
		draw_ellipse(
			inputClickableX1(), inputClickableY1(),
			inputClickableX2(), inputClickableY2(), false)
	}else{
		// screenScale is applied within drawRectangle
		draw_rectangle(
			inputClickableX1(), inputClickableY1(),
			inputClickableX2(), inputClickableY2(), false)
	}
}
draw_set_alpha(1)