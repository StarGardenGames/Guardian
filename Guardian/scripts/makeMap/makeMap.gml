/// @desc Creates a map structure with the inline
/// @param key1 First default key 
/// @param value1 First default value
/// @param key2 Second default key 
/// @param value2 Second default value
/// @param ... If you know of a beter was to do this let me know

var map = ds_map_create();
for(var i=0; i < argument_count; i+=2){
	map[? argument[i] ] = argument[i+1];	
}

return map;