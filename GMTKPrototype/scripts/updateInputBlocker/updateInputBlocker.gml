/// @desc Adds input blocker to input_blockers
/// @param blocker_name string name of blocker to add
/// @param exists true/false for whether the blocker exists
/// @param [id] Instance id for the input_blocker (default's to current id)

var blocker = argument[0];
var exists = argument[1];
var instance = (argument_count == 3)? argument[2] : id;

with(instance){
	if(!variable_instance_exists(id, "input_blockers")){
		initInputBlockers()	
	}
	if(exists and !inputBlockerExists(blocker)){
		addInputBlocker(blocker)	
	}
	if(!exists and inputBlockerExists(blocker)){
		removeInputBlocker(blocker)	
	}
}