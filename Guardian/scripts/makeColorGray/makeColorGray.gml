/// @desc Returns a grayscale color depending on the value
/// @param {0-255} grayscale
// Examples
// makeColorGray(0) -> $000000 (black)
// makeColorGray(128) -> $888888 (gray)
// makeColorGray(255) -> $ffffff (white)

var s = argument0;

return make_color_rgb(s,s,s);