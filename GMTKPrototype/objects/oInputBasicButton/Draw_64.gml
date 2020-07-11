draw_set_color(c_white)
image_alpha = (hover)? 1 : .5
var hold_scale = (checkHeld(input_name))? 1.15 : 1
image_xscale = hold_scale * (x2 - x1) / sprite_get_width(sprite_index)
image_yscale = hold_scale * (y2 - y1) / sprite_get_height(sprite_index)
draw_self()

if(selected){
	drawRectOutline(x-sprite_width/2, y-sprite_height/2, x+sprite_width/2, y+sprite_height/2, 10)
}

draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_set_color(c_black)
draw_text(x, y, input_name);
