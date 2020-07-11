/// @desc record user input to a file
/// @param file_name file to record the input to
/// @param [callback] script to call once the recording is done
var file_name = argument[0];
var callback = (argument_count==2)?argument[1]: undefined;
with(oInput){
	input_mode = INPUT_MODE.record;
	input_file_name = file_name;
	input_replay_callback = callback;
	input_num_restarts = 0;
	skip_write = true;
	game_restart();
}