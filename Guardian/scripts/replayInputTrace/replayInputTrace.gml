/// @desc replay user input from a file
/// @param file_name file to replay input from
/// @param [callback] script to call once the replay is done
var file_name = argument[0];
var callback = (argument_count==2)?argument[1]: undefined;
if(file_name == "" || file_name == undefined){
	throwError(file_name, " is not a valid name for a trace");	
}
with(oInput){
	if(input_mode == INPUT_MODE.record){
		inputWriteCurrentRecording();
	}
	input_mode = INPUT_MODE.replay;
	input_file_name = file_name;
	input_replay_callback = callback;
	input_frame = 0;
	input_num_restarts = 0;
	skip_write = true;
	call_callback_on_exit = false;
	game_restart();
}