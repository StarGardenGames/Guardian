/// @desc Check if any input blockers exist
/// @param [id] Instance id for the input_blocker (default's to current id)
var instance = (argument_count == 1)? argument[0] : id;

with(instance){
	return variable_instance_exists(id, "input_blockers") && ds_map_size(input_blockers) > 0;
}