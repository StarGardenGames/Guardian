/// @desc Reads a map from ini
/// @param section section to read the map from
/// @param key key to read the map from

var section = argument[0];
var key = argument[1];

var map = ds_map_create();
var map_str = ini_read_string(section, key, "");
if(map_str != ""){
	ds_map_read(map, map_str);	
}
return map;