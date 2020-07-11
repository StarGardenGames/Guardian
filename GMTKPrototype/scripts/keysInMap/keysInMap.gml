/// @desc Checks if array of keys exist in map
/// @param ds_map_id Map to check
/// @param arr array of keys

var map = argument0;
var keys = argument1;

for(var i = 0; i < array_length_1d(keys); i++){
	if(!ds_map_exists(map, keys[i])){
		return false;
	}
}

return true;