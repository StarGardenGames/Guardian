var col;
var text;
switch(level_state){
case LEVEL_STATE_2.won:
	col = c_green;
	text = "GOOD JOB!"
	break;
case LEVEL_STATE_2.lost:
	col = c_red;
	text = "YOU LOST CONTROL OF A PET! LET'S TRY THAT AGAIN"
	break;
case LEVEL_STATE_2.live:
	exit;
	break;
}


draw_set_font(fBigFont)
draw_set_color(col)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_text(room_width/2, room_height/2, text)