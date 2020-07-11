/// @desc this is a wrapper around checkPressed, if inputMapper/checkPressed exists, it will pass through, otherwise it will route to the build in function
/// @param input_name input to pass through

var input_name = argument0;

if(asset_get_index("checkPressed") != -1){
	return script_execute(asset_get_index("checkPressed"), input_name)
}else if(is_real(input_name)){
	return keyboard_check_pressed(input_name)	
}else{
	throwError(input_name, "is not a supported input. w/o the input mapper module, you're limited to vk_*")	
}