if(input_mode == INPUT_MODE.record && !skip_write){
	inputWriteCurrentRecording();
}

if(input_mode == INPUT_MODE.replay){
	if(call_callback_on_exit && input_replay_callback != undefined){
		script_execute(input_replay_callback, true);		
	}
}

if(variable_instance_exists(id, "key_log")){
	ds_map_destroy(key_log); 
}