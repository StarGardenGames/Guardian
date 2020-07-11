/// @desc this is a wrapper around keyboardStringClear, if inputMapper/keyboardStringClear exists, it will pass through, otherwise it will route to the build in function

if(asset_get_index("keyboardStringClear") != -1){
	script_execute(asset_get_index("keyboardStringClear"))
}else{
	keyboard_string = ""
}