/// @desc this is a wrapper around keyboardString, if inputMapper/keyboardString exists, it will pass through, otherwise it will route to the build in function

if(asset_get_index("keyboardString") != -1){
	return script_execute(asset_get_index("keyboardString"))
}else{
	return keyboard_string
}