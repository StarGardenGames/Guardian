event_inherited()

draw_set_font(fBigFont)
draw_set_valign(fa_top)
draw_text(x, y+10, (record[? "name" ]=="")?"<no name>":record[? "name" ])