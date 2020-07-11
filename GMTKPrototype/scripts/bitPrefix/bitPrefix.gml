/// @desc Returns sum of elements less than a certain index
/// @param bit bit structure
/// @param right right side of range (exclusive)

var bit = argument0;
var right = argument1;

var s = bitClone(bit_identity);
var prev_digit = 1
var digit = 2;
while(right != 0){
	if(right % digit == prev_digit){
		var s_new = script_execute(bit_sum_func, bit[| right], s)
		bitDestroy(s);
		s = s_new;
		right -= prev_digit;
	}
	prev_digit = digit;
	digit *= 2;
}
return s