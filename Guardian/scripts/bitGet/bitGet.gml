/// @desc Retrieves item from binary index tree
/// @param bit bit structure
/// @param index index to retrieve
var bit = argument0;
var index = argument1;
return bitRange(bit, index, index+1)