/// @desc Retrieves the current input method (and possibly the override)

with(oInput){
	if(input_method_override!=undefined){
		return input_method_override;
	}
	switch(os_type){
	case os_tvos:
		return INPUT_METHOD.remote;
	case os_ios:
	case os_android:
		return INPUT_METHOD.mobile;
	case os_linux:
	case os_macosx:
	case os_windows:
		return most_recent_input_method;
	default:
		throwError("Unsupported os")
	}
}