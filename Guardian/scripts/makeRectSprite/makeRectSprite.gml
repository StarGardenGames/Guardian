var ww = argument[0];
var hh = argument[1];
var cc = (argument_count >=3)? argument[2] : c_black;
var xoff = (argument_count >= 4)? argument[3] : 0;
var yoff = (argument_count >= 5)? argument[4] : 0;

var surf = surface_create(ww, hh);
surface_set_target(surf);
draw_clear(cc)
surface_reset_target();
var spr = sprite_create_from_surface(surf, 0, 0, ww, hh, false, false, 0, 0)
surface_free(surf)
sprite_set_offset(spr, xoff, yoff)

return spr;