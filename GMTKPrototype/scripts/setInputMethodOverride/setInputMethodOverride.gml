/// @desc Sets the input method override (will be used instead of the device input method
/// @param input_method entry using the oInput INPUT_METHOD enum

var input_method = argument0;

if(!instance_exists(oInput)) instanceCreate(oInput)

oInput.input_method_override = input_method;