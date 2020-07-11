/// @desc Generates a hash based on an array of items
/// @param arg1 First argument of series
/// @param arg2 Second argument of series
/// @param arg3 etc, this is a hack to make it look like var args in auto complete (same as choose())
/// @param ... If you know of a beter was to do this let me know

var p = [18229, 21937, 25643, 22621, 23869, 25349, 26777]
var num_primes = array_length_1d(p);
var m = 10000;

var n = 0;
for(var i = 0; i < argument_count; i++){
	var item = is_string(argument[i])?1000*string_to_decimal(argument[i]):argument[i];
	n = (p[i%num_primes] + (item * p[(i+1)%num_primes]) + (n * p[(i+2)%num_primes])) % m;
}

return n;