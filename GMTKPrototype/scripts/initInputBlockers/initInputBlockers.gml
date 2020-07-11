/// @desc Saves input_blockers structure to self
/// @param [id] Instance id for the input_blocker (default's to current id)

var instance = (argument_count == 1)? argument[0] : id;
with(instance){
	input_blockers = ds_map_create()
}
