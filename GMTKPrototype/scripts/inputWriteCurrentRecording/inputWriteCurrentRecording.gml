if(!directory_exists("recordings")){
	directory_create("recordings");	
}
	
// write locally
var file_name = inputGetTraceFileName(join("/", [input_file_name, input_num_restarts]))
var file = file_text_open_write(file_name)
file_text_write_string(file, json_encode(key_log));
file_text_close(file);
input_prev_test_file = file_name;
	
input_num_restarts++;
ds_map_destroy(key_log);