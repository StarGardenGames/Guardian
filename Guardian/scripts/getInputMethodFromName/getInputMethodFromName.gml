/// @desc Takes an input method as a string and returns the corresponding enum
/// @param [input_method_name] string version input method

var method_name = argument0;
with(oInput){
	switch(method_name){
	case "mouse": return INPUT_METHOD.mouse;
	case "keyboard": return INPUT_METHOD.keyboard;
	case "mobile": return INPUT_METHOD.mobile;
	case "gamepad": return INPUT_METHOD.gamepad;
	case "remote": return INPUT_METHOD.remote;
	}
}
throwError("Unsupported input method")