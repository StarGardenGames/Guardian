if(active){
	//insert command
	if(tryCheckPressed(vk_enter)){
		active = false;
    if(asset_get_index("releaseInputLock") != -1){
			script_execute(asset_get_index("releaseInputLock"));
		}else{
			log("WARNING: input mapper module isn't installed, so can't releaseInputLock.",
				"You'll need to add oConsole.active checks in your code to avoid input interference")
		}
		var cmds = stringSplitOutsideQuotes(command_string, ";")
		for(var i = 0; i < array_length_1d(cmds); i++){
			var output = consoleParseCmd(cmds[i]);
			if(output != ""){
				show_message_async(concat("Output: ",output));	
			}
		}
	}
	
	consoleUpdateCommandString()
	
}else if(tryInputDevMode()){
	if(tryCheckPressed(console_key)){
		command_string = ""
		command_string_before_cursor = ""
		cursor_pos = 0
		can_repeat = true;
		
		tryKeyboardStringClear();
		active = true;
		if(asset_get_index("claimInputLock") != -1){
			script_execute(asset_get_index("claimInputLock"));
		}else{
			log("WARNING: input mapper module isn't installed, so can't claimInputLock.",
				"You'll need to add oConsole.active checks in your code to avoid input interference")
		}
	}
}
