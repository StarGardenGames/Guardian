/// @desc Returns string version of the input method
/// @param [input_method] The input method to check (uses current method by default)

var method = (argument_count == 1)? argument[0] : getInputMethod();
with(oInput){
	switch(method){
	case INPUT_METHOD.mouse: return "mouse";
	case INPUT_METHOD.keyboard: return "keyboard";
	case INPUT_METHOD.mobile: return "mobile";
	case INPUT_METHOD.gamepad: return "gamepad";
	case INPUT_METHOD.remote: return "remote";
	}
}
throwError("Unsupported input method")