/// @desc Add input mapping
/// @param to_input which input to map to
/// @param from_input which input to map from, use game maker constant for method (i.e. vk_* for keyboard)
/// @param method Which input method is this
/// @param [is_dev] true/false is the to_input only used for dev purposes?

var to_input = argument[0];
var from_input = argument[1];
var method = argument[2];
var is_dev = (argument_count == 4)? argument[3] : false

if(from_input == "" || to_input == "") exit;

if(!itemInArray(method, [INPUT_METHOD.keyboard, INPUT_METHOD.mouse, INPUT_METHOD.gamepad])){
	throwError("Game Maker doesn't have any specific input functions for this method : ", getInputMethodName(method));
}

if(!instance_exists(oInput)) instanceCreate(oInput)

with(oInput){
	var from_inputs = is_array(from_input)? from_input : [from_input];
	for(var i = 0; i < array_length_1d(from_inputs); i++){
		ds_map_set(mappings[? method], from_inputs[i], to_input);
		inputAddInputName(to_input)
	}
	
	if(is_dev){
		dev_inputs[? to_input ] = true;
	}
}