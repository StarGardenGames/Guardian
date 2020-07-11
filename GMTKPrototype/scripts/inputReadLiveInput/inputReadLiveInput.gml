//store initial state
ds_map_copy(start_pressed, pressed)
ds_map_copy(start_held, held)
ds_map_copy(start_released, released)

//clear for new inputs
ds_map_clear(pressed);
ds_map_clear(held);
ds_map_clear(released);

//update mouse positions
with(oInputMouse){
	inputMouseUpdatePosition();	
}

//update button states
with(oInputClickable){
	inputClickableUpdateState();
}

// resolve conflicts if necessary
if(resolve_conflicts_on_depth){
	// remove items that can be clicked
	var next_button_is_blocked = false;
	while(ds_priority_size(depth_pri) and !next_button_is_blocked){
		var b = ds_priority_delete_min(depth_pri)
		next_button_is_blocked = !b.can_click_through
	}
	// remove all others and disable them
	while(ds_priority_size(depth_pri)){
		with(ds_priority_delete_min(depth_pri)){
			pressed = false
			held = false
			released = false
			hover = false
		}
	}
}

ds_priority_clear(depth_pri) // outside if statement, since clickable adds to the struct regardless

//loop through key mappings
var key_mappings = mappings[? INPUT_METHOD.keyboard ];

for(var from_key=ds_map_find_first(key_mappings); !is_undefined(from_key); from_key=ds_map_find_next(key_mappings, from_key)){
	var to_input = key_mappings[? from_key ];

	if(!dev_mode && dev_inputs[? to_input ]) continue;
	
	// add it if it doesn't already exists, this avoids map dne errors
	if(!ds_map_exists(pressed, to_input)){
		pressed[? to_input ] = false;
		held[? to_input ] = false;
		released[? to_input ] = false;
	}
	
	if(itemInArray(INPUT_METHOD.keyboard, primary_desktop_input_methods) && keyboard_check(from_key)){
		most_recent_input_method = INPUT_METHOD.keyboard;
	}
	
	pressed[? to_input ] = pressed[? to_input ] || keyboard_check_pressed(from_key);
	held[? to_input ] = held[? to_input ] || keyboard_check(from_key);
	released[? to_input ] = released[? to_input ] || keyboard_check_released(from_key);
}

//clickable buttons
with(oInputClickable){
	if(id.input_name == "") continue;
	other.pressed[? id.input_name] = other.pressed[? id.input_name] || pressed;
	other.held[? id.input_name] = other.held[? id.input_name] || held;
	other.released[? id.input_name] = other.released[? id.input_name] || released;	
}

//loop through mouse mappings
for(var from_mb = ds_map_find_first(mappings[? INPUT_METHOD.mouse ]); !is_undefined(from_mb) ; from_mb=ds_map_find_next(mappings[? INPUT_METHOD.mouse ], from_mb)){
	var to_input = ds_map_find_value(mappings[? INPUT_METHOD.mouse ], from_mb)
	if(!dev_mode && dev_inputs[? to_input ]) continue;
	
	if(!ds_map_exists(pressed, to_input)){
		pressed[? to_input ] = false;
		held[? to_input ] = false;
		released[? to_input ] = false;
	}
	
	pressed[? to_input ] = pressed[? to_input ] || mouse_check_button_pressed(from_mb);
	held[? to_input ] = held[? to_input ] || mouse_check_button(from_mb);
	released[? to_input ] = released[? to_input ] || mouse_check_button_released(from_mb);
	
	// update most recent input
	var any_button_pressed = mouse_check_button_pressed(from_mb) || mouse_check_button(from_mb) || mouse_check_button_released(from_mb);
	if(itemInArray(INPUT_METHOD.mouse, primary_desktop_input_methods) && any_button_pressed){
		most_recent_input_method = INPUT_METHOD.mouse;
	}
}

// check if mouse moved
var mouse_moved = false;
with(oInputMouse){
	mouse_moved = mouse_moved || moved;
}
if(mouse_moved){
	tab_x = undefined;
	tab_y = undefined;
	if(itemInArray(INPUT_METHOD.mouse, primary_desktop_input_methods)){
		most_recent_input_method = INPUT_METHOD.mouse;
	}
}

//loop through gamepad mappings
var gamepad_mappings = mappings[? INPUT_METHOD.gamepad ]
for(var d = 0; d < gamepad_get_device_count(); d++){
	for(var button = ds_map_find_first(gamepad_mappings); !is_undefined(button) ; button=ds_map_find_next(gamepad_mappings, button)){
		if(!dev_mode && dev_inputs[? gamepad_mappings[? button ] ]) continue;
		if(gamepad_button_check(d, button) && itemInArray(INPUT_METHOD.gamepad, primary_desktop_input_methods)){
			most_recent_input_method = INPUT_METHOD.gamepad;
		}
		pressed[? gamepad_mappings[? button] ] = pressed[? gamepad_mappings[? button] ] || gamepad_button_check_pressed(d, button);
		held[? gamepad_mappings[? button] ] = held[? gamepad_mappings[? button] ] || gamepad_button_check(d, button);
		released[? gamepad_mappings[? button] ] = released[? gamepad_mappings[? button] ] || gamepad_button_check_released(d, button);
	}
	
	for(var dir = -1; dir <= 1; dir+=2){ // just loops over [-1, 1]
		var stick_mapping = (dir == -1)? neg_stick_mappings : pos_stick_mappings;
		//these must be separate loops because the second one is dependent on held
		for(var stick_axis = ds_map_find_first(stick_mapping); !is_undefined(stick_axis) ; stick_axis=ds_map_find_next(stick_mapping, stick_axis)){
			var axis_val = gamepad_axis_value(d, stick_axis);
			var map_to = stick_mapping[? stick_axis];
			var stick_tilted = (sign(axis_val) == dir && abs(axis_val) > deadzone);
			if(stick_tilted && itemInArray(INPUT_METHOD.gamepad, primary_desktop_input_methods)){
				most_recent_input_method = INPUT_METHOD.gamepad;
			}
			held[? map_to] = held[? map_to] || stick_tilted;
		}
	}
}

// if at least one device remained held, then pressed/released should be false
for(var d = 0; d < gamepad_get_device_count(); d++){
	for(var dir = -1; dir <= 1; dir+=2){ // just loops over [-1, 1]
		var stick_mapping = (dir == -1)? neg_stick_mappings : pos_stick_mappings;
		for(var stick_axis = ds_map_find_first(stick_mapping); !is_undefined(stick_axis) ; stick_axis=ds_map_find_next(stick_mapping, stick_axis)){
			var map_to = stick_mapping[? stick_axis];
			pressed[? map_to] = pressed[? map_to] || (!start_held[? map_to] && held[? map_to]);
			released[? map_to] = released[? map_to] || (start_held[? map_to] && !held[? map_to]);
		}
	}
}

//anykey
pressed[? vk_anykey] = keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_any)
held[? vk_anykey] = keyboard_check(vk_anykey) || mouse_check_button(mb_any)
released[? vk_anykey] = keyboard_check_released(vk_anykey) || mouse_check_button_released(mb_any)

var all_gp_buttons = [
	gp_face1, gp_face2, gp_face3, gp_face4,
	gp_padd, gp_padu, gp_padl, gp_padr,
	gp_shoulderl, gp_shoulderr, gp_shoulderlb, gp_shoulderrb,
	gp_select, gp_start
]
for(var i = 0; i < array_length_1d(all_gp_buttons); i++){
	var b = all_gp_buttons[i]; 
	for(var d = 0; d < gamepad_get_device_count(); d++){
		pressed[? vk_anykey] = pressed[? vk_anykey] || gamepad_button_check_pressed(d, b);
		held[? vk_anykey] = held[? vk_anykey] || gamepad_button_check(d, b);
		released[? vk_anykey] = released[? vk_anykey] || gamepad_button_check_released(d, b);
	}
}

//update keyboard_string
if(string_length(keyboard_string) != string_length(prev_keyboard_string)){
	//typed more characters
	if(string_length(keyboard_string) > string_length(prev_keyboard_string)){
		delta_keyboard_string = string_copy(keyboard_string, string_length(prev_keyboard_string)+1, string_length(keyboard_string))
		full_keyboard_string = concat(full_keyboard_string, delta_keyboard_string);
		num_letters_removed = 0;
	//backspaced characters
	}else{
		num_letters_removed = string_length(prev_keyboard_string) - string_length(keyboard_string);
		full_keyboard_string = string_copy(
			full_keyboard_string,
			1, 
			string_length(full_keyboard_string) - num_letters_removed
		)
	}
	prev_keyboard_string = keyboard_string;
}else{
	delta_keyboard_string = "";
	num_letters_removed = 0;	
}