/// @desc Tries to receive a value from nested maps/lists using multiple keys
/// @param map ds_map to use
/// @param key1 first key to retrieve
/// @param key2 second key to retrive
/// @param ... arbitraty number of other keys
/// @param default default value to retrieve for the map

// NOTE: This makes 2 hugish assumptions. 
//      1. numbers are only used to reference list positions, map can't index on numbers
//		2. arrays won't be used to index on maps (instead they're assumped to be a array of keys) 

var _struct = argument[0];
var def = argument[argument_count-1];

if(_struct == undefined) return def;

var keys;
if(is_array(argument[1])){
	keys = argument[1]
}else{
	keys = []
	for(var i = 1; i < argument_count-1; i++){
		keys[i-1] = argument[i];
	}
}

for(var i = 0; i < array_length_1d(keys); i++){
	if(is_real(keys[i])){
		if(ds_list_size(_struct) < keys[i]){
			_struct = _struct[| keys[i] ];	
		}else{
			return def;	
		}
	}else{
		if(ds_map_exists(_struct, keys[i])){
			_struct = _struct[? keys[i] ];
		}else{
			return def;
		}
	}
}

return _struct;