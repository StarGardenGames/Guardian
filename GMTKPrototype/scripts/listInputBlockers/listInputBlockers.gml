/// @desc Returns a space separated string of all input_blockers
/// @param [id] Instance id for the input_blocker (default's to current id)

var instance = (argument_count == 2)? argument[1] : id;

var str = "";

with(instance){
	if(variable_instance_exists(id, "input_blockers")){
		for(var key = ds_map_find_first(input_blockers); !is_undefined(key); key = ds_map_find_next(input_blockers, key)){
			str = concat(str, " ", key);
		}
	}
}
return str;
