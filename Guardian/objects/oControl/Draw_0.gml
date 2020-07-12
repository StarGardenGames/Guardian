var col;
var text;
switch(level_state){
case LEVEL_STATE_2.won:
	col = make_color_rgb(19,249,131);
	text = "GOOD JOB!"
	break;
case LEVEL_STATE_2.lost:
	col = make_color_rgb(255,255,255);
	text = "YOU LOST CONTROL OF A PET!\nLET'S TRY THAT AGAIN"
	break;
case LEVEL_STATE_2.live:
	exit;
	break;
}

draw_set_alpha(.5)
draw_set_color(c_black)
draw_rectangle(0, 0, 1280, 720, false)

//set text to alpha 1
draw_set_alpha(1)

draw_set_font(fBigFont)
draw_set_color(col)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_text(room_width/2, room_height/2, text)