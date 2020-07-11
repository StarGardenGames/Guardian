active = false
draw_set_font(fSGGConsole);

prompt_text_height = string_height("H");
prompt_margin = prompt_text_height*.1
prompt_height = prompt_text_height + prompt_margin*2


// I don't think I actually got this working :'( 
for(var i = 0; i<parameter_count(); i++){
	if(itemInArray(parameter_string(i+1), ["-c", "--console"])){
		consoleParseCmd(parameter_string(i+2));
	}
}

command_string = ""
command_string_before_cursor = ""
cursor_pos = 0;
can_repeat = true;
repeat_time = 3
start_repeat_time = 15

console_key = ord("C")