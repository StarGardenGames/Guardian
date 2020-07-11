/// @desc Computes modulo (not modulus) between 2 numbers 
/// @param a first input
/// @param b second input
// Examples
// modulo(6,5) -> 1
// 6%5 -> 1
// modulo(-6,5) -> -4
// (-6)%5 -> -1


var a = argument0;
var b = argument1;
return (a%b < 0)? (a%b+b) : (a%b);