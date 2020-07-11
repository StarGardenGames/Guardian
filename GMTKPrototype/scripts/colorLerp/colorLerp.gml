/// @desc Returns a interpolated (blended) version of the 2 colors
/// @param col1 first color
/// @param col2 second color
/// @param {0-1} t interpolation amount
/// @param {bool} use_rgb Defaults to hsv
// Examples
// colorLerp(c_red, c_green, 0) -> c_red
// colorLerp(c_red, c_green, 0) -> c_green
// colorLerp(c_red, c_green, .5) -> c_yellow
// I default to hsv because it looks prettier, but you can use rgb if you want
// colorLerp(c_red, c_green, .5, true) -> puke yellow

// Play the angel level in Binary Dash to see how this is used ;)

var p = argument[0];//prev
var n = argument[1];//next
var t = argument[2];

var use_rgb = false;
if(argument_count == 4){
    use_rgb = argument[3];
}

if(use_rgb){
    return make_color_rgb(
        lerp(color_get_red(p),color_get_red(n),t),
        lerp(color_get_green(p),color_get_green(n),t),
        lerp(color_get_blue(p),color_get_blue(n),t)
    )
}else{
    var hue;
    var diff = abs(color_get_hue(n) - color_get_hue(p))
    var s = sign(color_get_hue(n) - color_get_hue(p))
    if(diff < 128){
        hue = color_get_hue(p) + lerp(0,diff,t)*s;
    }else{
        hue = color_get_hue(p) + lerp(0,255-diff,t)*-s;
    }
    while(hue < 0){
        hue += 255;    
    }
    hue = hue%255;
    return make_color_hsv(
        hue,
        lerp(color_get_saturation(p),color_get_saturation(n),t),
        lerp(color_get_value(p),color_get_value(n),t)
    )
}
