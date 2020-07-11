/// @desc this is a wrapper around inputDevMode, if inputMapper/keyboardStringClear exists, it will pass through, return true

var scr = asset_get_index("inputDevMode")
if(scr != -1){
	return script_execute(scr)	
}else{
	return true	
}