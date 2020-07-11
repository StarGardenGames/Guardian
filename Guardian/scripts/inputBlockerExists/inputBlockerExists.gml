/// @desc Check if a specific input blocker exists
/// @param blocker_name string name of blocker to remove
/// @param [id] Instance id for the input_blocker (default's to current id)

var blocker = argument[0];
var instance = (argument_count == 2)? argument[1] : id;

if(!variable_instance_exists(instance, "input_blockers")) return false;

with(instance){
	return ds_map_exists(input_blockers, blocker);
}

return false