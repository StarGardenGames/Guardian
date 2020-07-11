// NOTE: this will be drawn above the player
// normally I'd probably want this below the player, but I wanted the object to be on this layer for the draw gui event
// if this was a production game, I'd solve this by handling the drawing in separate objects, but I don't want to do that for the example

draw_set_color(c_white)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_text_ext(room_width/2, 150, concat("(", getInputMethodName(), ") ", instructions[? getInputMethod() ]), string_height("A"), 600)
draw_text_ext(room_width/2, 650, concat("TIP: ", tips[ tip_index ]), string_height("A"), 600)