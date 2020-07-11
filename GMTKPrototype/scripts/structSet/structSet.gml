/// @desc Tries to receive a value from nested maps/lists using multiple keys
/// @param map ds_map to use
/// @param key1 first key to retrieve
/// @param key2 second key to retrive
/// @param ... arbitraty number of other keys

// NOTE: This makes 2 hugish assumptions. 
//      1. numbers are only used to reference list positions, map can't index on numbers
//		2. arrays won't be used to index on maps (instead they're assumped to be a array of keys) 

var _struct = argument[0]; // I added an underscore because struct on it's own was a syntax error?
var new_val = argument[argument_count -1]

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
		if(keys[i] < ds_list_size(_struct)){
			if(i == array_length_1d(keys)-1){
				_struct[| keys[i] ] = new_val;
			}else{
				_struct = _struct[| keys[i] ];
			}
		}else{
			throwError("Couldn't find", keys[i], "in list")
		}
	}else{
		if(i == array_length_1d(keys)-1){
			_struct[? keys[i] ] = new_val;
		}else{
			if(!ds_map_exists(_struct, keys[i])){
				if(is_real(keys[i+1])){
					ds_map_add_list(_struct, keys[i], ds_list_create())
				}else{
					ds_map_add_map(_struct, keys[i], ds_map_create())
				}
			}
			_struct = _struct[? keys[i] ];
		}
	}
}

return _struct;