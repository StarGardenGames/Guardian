/// @desc Compares elements of 2 arrays and checks if they're equal
/// @param {array} arr1
/// @param {array} arr2 

var arr_a = argument0;
var arr_b = argument1;

if(array_length_1d(arr_a) != array_length_1d(arr_b)) return false;

for(var i = 0; i < array_length_1d(arr_a); i++){
	if(arr_a[i] != arr_b[i]) return false;	
}

return true;