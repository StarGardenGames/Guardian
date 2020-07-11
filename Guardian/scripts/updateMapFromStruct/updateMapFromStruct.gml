/// @desc Takes a map structure and the overwrite the items with the items of the other map
/// @param to_map ds_map to set defaults to
/// @param from_struct ds_map or array to set defaults from

var to_map = argument[0];
var from_struct = argument[1];
if(is_array(from_struct)){
	for(var i=0; i < array_length_1d(from_struct); i+=2){
		var key = from_struct[i]
		var value = from_struct[i+1]
		to_map[? key ] = value;	
	}
}else{
	// This is similar to ds_map_copy except it doesn't clear the dest map first
	for(var key=ds_map_find_first(from_struct); key != undefined; key=ds_map_find_next(from_struct, key)){
		to_map[? key] = from_struct[? key]
	}
}

return to_map;