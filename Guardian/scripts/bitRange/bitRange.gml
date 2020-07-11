/// @desc Returns sum of elements across a range
/// @param bit bit structure
/// @param left left side of range (inclusive)
/// @param right right side of range (exclusive)

var bit = argument0;
var left = argument1;
var right = argument2;

var p_r = bitPrefix(bit, right)
var p_l = bitPrefix(bit, left)

var output = script_execute(bit_sub_func, p_r, p_l);

bitDestroy(p_r);
bitDestroy(p_l);

return output;