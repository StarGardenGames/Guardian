// respond to backspace (I can't rely on keyboard string becuase I'm always clearing it)
if(tryCheckHeld(vk_backspace) && can_repeat && cursor_pos > 0){
	command_string = concat(
		string_copy(command_string, 0, cursor_pos-1), 
		string_copy(command_string, cursor_pos+1, string_length(command_string)-cursor_pos)
	)
	cursor_pos--;
		
	can_repeat = false;
	alarm[0] = (tryCheckPressed(vk_backspace))? start_repeat_time : repeat_time;
}
	
if(tryCheckReleased(vk_backspace)){
	can_repeat = true;	
	alarm[0] = -1
}
	
// respond to new typing
if(!tryCheckHeld(vk_backspace) && string_length(tryKeyboardString()) > 0){
	
	command_string = concat(
		string_copy(command_string, 0, cursor_pos), 
		tryKeyboardString(), 
		string_copy(command_string, cursor_pos+1, string_length(command_string)-cursor_pos)
	)
	cursor_pos += string_length(tryKeyboardString())
}
	
// update cursor position for arrow keys
if((tryCheckHeld(vk_right) - tryCheckHeld(vk_left)) !=0 && can_repeat){
	cursor_pos = clamp(
		cursor_pos + tryCheckHeld(vk_right) - tryCheckHeld(vk_left), 
		0, 
		string_length(command_string)
	)
	
	can_repeat = false;
	alarm[0] = (tryCheckPressed(vk_right) || tryCheckPressed(vk_left))? start_repeat_time : repeat_time;
}
	
if(tryCheckReleased(vk_right) || tryCheckReleased(vk_left)){
	alarm[0] = -1
	can_repeat = true;
}

tryKeyboardStringClear()