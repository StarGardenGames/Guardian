/// @desc Checks whether an input is released
/// @param input_name name of the input to check

var input_name = argument0;

if(!instance_exists(oInput)) instanceCreate(oInput)

with(oInput){
	// I want checkReleased(vk_*) to work without mapping for convenience
	// so if it's a number I'm assuming it's a vk_* variable
	var r = is_real(input_name)
	var i = ds_list_find_index(all_input_names, input_name)
	if(is_real(input_name) && ds_list_find_index(all_input_names, input_name) == -1){	
		addInputMapping(input_name, input_name, INPUT_METHOD.keyboard)	
	}
	
	if(inputInstanceHasAccess(other.id) && ds_map_exists(released, input_name)){
		return released[? input_name];
	}
}
return false;