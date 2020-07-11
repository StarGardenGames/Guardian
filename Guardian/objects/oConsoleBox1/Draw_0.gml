draw_set_color(image_blend)
draw_rectangle(x-width/2, y-height/2, x+width/2, y+height/2, false)

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(x-width/2+10, y-height/2+10, object_get_name(object_index))