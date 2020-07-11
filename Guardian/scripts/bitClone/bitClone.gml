/// @desc returns a shallow copy of the structure
// @param val item to clone

var item = argument0;
switch(bit_type){
case undefined:
	return item; //strings & ints do not need cloning
case ds_type_list:
	var o = ds_list_create()
	for(var i = 0; i < ds_list_size(item); i++){
		ds_list_add(o, item[| i]);	
	}
	return o;
case ds_type_map:
	var o = ds_map_create()
	for(var i = ds_map_find_first(item); i != undefined; ds_map_find_next(item, i)){
		o[? i] = item[? i];	
	}
	return o;
default:
	throwError("Invalid type:", bit_type);
}