/// @desc Adds input blocker to input_blockers
/// @param blocker_name string name of blocker to add
/// @param [id] Instance id for the input_blocker (default's to current id)

var blocker = argument[0];
var instance = (argument_count == 2)? argument[1] : id;

with(instance){
	if(!variable_instance_exists(id, "input_blockers")){
		initInputBlockers()	
	}

	input_blockers[? blocker ] = true;
}