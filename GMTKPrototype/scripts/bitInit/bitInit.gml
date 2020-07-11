/// @desc Returns the structure of an empty binary index tree
/// @param [sum_func] script to combine 2 items (defaults to integer add)
/// @param [sub_func] script to subtract 2 items (defaults to integer subtract)
/// @param [identity] the identity item (defaults to 0)
/// @param [type] what type of struct are the items ds_type_map, ds_type_list, etc. 
// note: This is specifically used for memory management, if it's a primitive type just leave it as undefined

switch(argument_count){
case 0:
	bit_sum_func = bitSum
	bit_sub_func = bitSub
	bit_identity = 0;
	bit_type = undefined;
	break;
case 3:
	bit_sum_func = argument[0]
	bit_sub_func = argument[1]
	bit_identity = argument[2]
	bit_type = undefined;
	break;
case 4:
	bit_sum_func = argument[0]
	bit_sub_func = argument[1]
	bit_identity = argument[2]
	bit_type = argument[3];
	break;
default:
	throwError("Invalid number of input arguments")
}
//the first element will always be the identity
//also the size of a n element bit is n+1, so zero element needs to be 1
return arrayToList([bit_identity]);
/*bitMarkType(bit) //these lines caused a crash, but it's ok since we don't seem to need it anyway
return bit;*/
