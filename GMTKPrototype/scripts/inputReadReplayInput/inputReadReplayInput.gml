ds_map_clear(pressed);
var pressed_list = key_log[? concat(input_frame, "_pressed")]
for(var i = 0; pressed_list != undefined && i < ds_list_size(pressed_list); i++){
	pressed[? pressed_list[| i] ] = true;
}

ds_map_clear(held);
var held_list = key_log[? concat(input_frame, "_held")]
for(var i = 0; held_list != undefined && i < ds_list_size(held_list); i++){
	held[? held_list[| i] ] = true;
}

ds_map_clear(released);
var released_list = key_log[? concat(input_frame, "_released")]
for(var i = 0; released_list != undefined && i < ds_list_size(released_list); i++){
	released[? released_list[| i] ] = true;
}

var bit_index = binarySearch(key_log[? "keyboard_string"], input_frame+1, inputKeyboardStringGreaterThan)
var o = bitPrefix(key_log[? "keyboard_string"], bit_index)
full_keyboard_string = o[| 2]

if(input_frame >= key_log[? "final_frame"]){
	if(input_replay_callback == undefined){
		show_message(concat("TEST ", input_file_name ," COMPLETE"));
		game_end();
	}else{
		call_callback_on_exit = false;
		script_execute(input_replay_callback);		
	}
}

input_frame++
