if(active){
	//draw box
	draw_set_alpha(.5);
	draw_set_color(c_black);
	draw_rectangle(0, camH()-prompt_height, camW(), camH(), false);
	
	//draw text
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_left);
	draw_set_font(fSGGConsole);
	var visible_offset = min(0, room_width - string_width(concat("/",command_string)) -10)
	var text_x = prompt_margin+visible_offset
	draw_text(text_x, camH()-prompt_margin, concat("/",command_string));
	
	//draw cursor
	draw_set_color(c_white)
	draw_text(
		text_x+string_width(concat("/", string_copy(command_string, 0, cursor_pos))) - string_width("|")/2, 
		camH()-prompt_margin,
		"|"
	);
}