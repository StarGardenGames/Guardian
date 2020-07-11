/// @desc Mark a index in the bit to match the data type of the bit
/// @param bit bit structure
/// @param [index] index to mark (defaults to latest)

var bit = argument[0];
var index = (argument_count == 2)? argument[1] : ds_list_size(bit)-1;

switch(bit_type){
case undefined:
	//no mark necessary, it's probably a string or an int
	break;
case ds_type_list:
	ds_list_mark_as_list(bit, index);
	break;
case ds_type_map:
	ds_list_mark_as_map(bit, index);
	break;	
default:
	throwError("BIT: Invalid type: ", bit_type);
}