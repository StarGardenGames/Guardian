/// @desc Return first 1 in an integer
/// @param i integer to check
// example
// 2 (010) -> 2 (010)
// 4 (100) -> 4 (100)
// 5 (101) -> 1 (001)
// 6 (110) -> 2 (010)

// parent = i + i&(-i)
var i = argument0;

// first_one = i&(-i)
var first_one = 1;
while(i % (first_one*2) == 0){
	first_one*=2
}

return first_one