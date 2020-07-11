/// @desc Takes a map structure and the overwrite the items with the args
/// @param map ds_map to set defaults on
/// @param key1 First default key 
/// @param value1 First default value
/// @param key2 Second default key 
/// @param value2 Second default value
/// @param ... If you know of a beter was to do this let me know

var map = argument[0];
for(var i=1; i < argument_count; i+=2){
	map[? argument[i] ] = argument[i+1];	
}

return map;