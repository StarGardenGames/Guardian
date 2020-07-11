enum INPUT_MODE{	
	standard,
	record,
	replay
}

enum INPUT_METHOD{
	keyboard,
	mouse,
	gamepad,
	mobile,
	remote
}

enum MOUSE_TYPE{
	desktop,
	mobile,
	tab
}

resolve_conflicts_on_depth = true
depth_pri = ds_priority_create()

input_method_override = undefined
dev_mode = false;

// create global variables to remain persistent across game_restart() calls
//if this is the first run (i.e. game_restart() has never been called) then init global variables
if(!variable_global_exists("input_mode")){
	globalvar input_mode, input_replay_callback,
			  input_file_name, input_start_fps, input_fps_index, input_num_restarts, input_prev_test_file,
			  input_apply_save_data_string_script, input_save_data_to_string_script;
	input_mode = INPUT_MODE.standard;
	input_replay_callback = undefined;
	input_file_name = "";
	
	input_start_fps = game_get_speed(gamespeed_fps);
	input_fps_index = 1
	input_num_restarts = 0
	input_prev_test_file = "";
	input_apply_save_data_string_script = undefined;
	input_save_data_to_string_script = undefined;
}

// input methods that can be returned by getInputMethod for desktop platforms
primary_desktop_input_methods = [INPUT_METHOD.keyboard, INPUT_METHOD.gamepad]

input_frame = 0; // this should start at 0 on every game_restart() so it doesn't need to be global

fps_scales = [0.1, 1, 2, 5, 100]
fps_display_timer = 0
game_set_speed(input_start_fps*fps_scales[input_fps_index], gamespeed_fps);

//init key log
var bit = bitInit(inputKeyboardStringConcat, inputKeyboardStringSubtract, arrayToList([0, 0, ""]), ds_type_list);
switch(input_mode){
case INPUT_MODE.replay:
	// input_file_name should already include the restart num
	key_log = loadJsonFile(inputGetTraceFileName(join("/", [input_file_name, input_num_restarts]))); 
	ds_list_destroy(bit);
	if(input_apply_save_data_string_script != undefined){
		script_execute(input_apply_save_data_string_script, key_log[? "initial_state" ])
	}
	break;
case INPUT_MODE.record:
	key_log = ds_map_create();
	if(input_save_data_to_string_script != undefined){
		key_log[? "initial_state" ] = script_execute(input_save_data_to_string_script)
	}
	ds_map_add_list(key_log, "keyboard_string", bit);
	break;
}

alarm[0] = 30.0000*10

//keys to monitor
dev_inputs = ds_map_create();

mappings = ds_map_create();
ds_map_add_map(mappings, INPUT_METHOD.keyboard, ds_map_create())
ds_map_add_map(mappings, INPUT_METHOD.mouse, ds_map_create())
ds_map_add_map(mappings, INPUT_METHOD.gamepad, ds_map_create())

//TODO: I should look into removing all_input_names, it seems like I can get the same value from
//      looping over the mappings keys, and keeping leaves me open for data sync issues
//		At the very least I should reconsider the structure, it's a list but I'm treating it like a set
all_input_names = ds_list_create();

pos_stick_mappings = ds_map_create();
neg_stick_mappings = ds_map_create();
full_keyboard_string = "";
keyboard_string_index = 0;
prev_keyboard_string = "";
delta_keyboard_string = "";
num_letters_removed = 0;

deadzone = .25;

// make mouse objects
with(instanceCreate(oInputMouse)){ mouse_type = MOUSE_TYPE.desktop }
with(instanceCreate(oInputMouse)){ mouse_type = MOUSE_TYPE.tab }

for(var i = 0; i < 4; i++){
	m = instanceCreate(oInputMouse);
	m.mouse_type = MOUSE_TYPE.mobile;
	m.index = i;
}

//priority lock
locks = ds_priority_create();

//init key states to false
pressed = ds_map_create()
held = ds_map_create()
released = ds_map_create()
start_pressed = ds_map_create()
start_held = ds_map_create()
start_released = ds_map_create()

// tabbing system
tab_key = vk_tab;
enter_key = vk_enter;
tab_x = undefined;
tab_y = undefined;

gamepad_count = 0;

most_recent_input_method = INPUT_METHOD.keyboard;

skip_write = false;

call_callback_on_exit = true;