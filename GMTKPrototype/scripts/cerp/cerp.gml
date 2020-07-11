/// @desc Finds bicubic interpolation between 2 points
/// @param y1 y value at first point
/// @param dy1 slope at first point
/// @param y2 y value at second point
/// @param dy2 slope at second point
/// @param t how far to interpolate

var y1 = argument0
var dy1 = argument1
var y2 = argument2
var dy2 = argument3
var t = argument4

// compute terms y = ax^3 + bx^2 + cx + d
// https://www.paulinternet.nl/?page=bicubic#:~:text=find%20an%20error.-,Cubic%20interpolation,polynomial%20can%20be%20easily%20derived.
var a =  2*y1 -2*y2 +  dy1 +dy2
var b = -3*y1 +3*y2 -2*dy1 -dy2
var c =                dy1
var d =    y1

return a*power(t,3) + b*power(t,2) + c*t + d
