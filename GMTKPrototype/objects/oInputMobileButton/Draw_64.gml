event_inherited()

draw_set_color(c_white)
draw_circle(x, y, min(x2 - x1, y2 - y1)/2, false)

var hold_scale = (checkHeld(input_name))? 1.5 : 1
image_xscale = hold_scale
image_yscale = hold_scale

draw_self()

