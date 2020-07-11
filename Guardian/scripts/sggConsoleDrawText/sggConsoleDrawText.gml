draw_set_color(image_blend);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fSGGConsoleBox);
var txt = (object_index == oConsoleText0)? text : concat(object_get_name(object_index), ":\n", text);
draw_text_ext(xstart, ystart, txt, 
				string_height("A"), oConsoleExample.box_width);