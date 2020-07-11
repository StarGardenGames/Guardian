/// @desc Destroys an item from the tree, freeing all the memory
// @param bit binary index tree structure
// @param item item to destroy

var item = argument0;
switch(bit_type){
case undefined:
	//strings & ints do not need destruction
	break;
case ds_type_list:
	ds_list_destroy(item);
	break;
case ds_type_map:
	ds_map_destroy(item);
	break;
default:
	throwError("Invalid type:", bit_type);
}