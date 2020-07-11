//handle recording
//there's a conundrum here, there are 2 features I want this recorder to have
// * recored arbitrary key strokes
// * support multiple keys at once
// keyboard_key is great for arbitrary keystrokes but it doesn't support multi-key
// for multi key I'd need to explicitly check both keys
// so there's no real way to do both unless I'm explicitly checking both
// The compromise here is that I'm supporting single for any key, but only supporting 
//		mutli for those thare are explicitly mapped

if(!window_has_focus()) exit

//update keyboard_string

if(delta_keyboard_string != "" || num_letters_removed > 0){
	bitAdd(key_log[? "keyboard_string"], arrayToList([input_frame, num_letters_removed, delta_keyboard_string]));
}

//loop through key mappings
for(var i = 0; i < ds_list_size(all_input_names); i++){
	var input_name = all_input_names[| i]
	if(pressed[? input_name]){
		if(!ds_map_exists(key_log, concat(input_frame, "_pressed"))){
			ds_map_add_list(key_log, concat(input_frame, "_pressed"), ds_list_create());
			key_log[? "final_frame"] = input_frame;
		}
		ds_list_add(key_log[? concat(input_frame, "_pressed")], input_name );
	}
	if(held[? input_name]){
		if(!ds_map_exists(key_log, concat(input_frame, "_held"))){
			ds_map_add_list(key_log, concat(input_frame, "_held"), ds_list_create());
			key_log[? "final_frame"] = input_frame;
		}
		ds_list_add(key_log[? concat(input_frame, "_held")], input_name);
	}
	if(released[? input_name]){
		if(!ds_map_exists(key_log, concat(input_frame, "_released"))){
			ds_map_add_list(key_log, concat(input_frame, "_released"), ds_list_create());
			key_log[? "final_frame"] = input_frame;
		}
		ds_list_add(key_log[? concat(input_frame, "_released")], input_name);	
	}
}

// as long as the game is running keep updating final_frame
key_log[? "final_frame"] = input_frame; 

//update vars
input_frame++