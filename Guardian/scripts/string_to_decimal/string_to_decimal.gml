/// @desc Takes a string a returns a number within [0, 1)
/// @param str String to comput
// The important part here is that the same number is outputted for all possible strings
// I'm trying to add randomness, this way I can get a uniform ish distribution for any set of strings
//		I may be using
// Algorithm explanation
// https://www.youtube.com/watch?v=SxP30euw3-0 (starting at 3:11)

var s = argument0;

var p1 = 18229;
var p2 = 21937;
var p3 = 25253;
var m = 1000;

var n = 0;
for(var i = 0; i <= string_length(s); i++){
	b = string_byte_at(s, i);	
	n = (p1 + (b * p2) + (n * p3)) % m
}

return n / m;

