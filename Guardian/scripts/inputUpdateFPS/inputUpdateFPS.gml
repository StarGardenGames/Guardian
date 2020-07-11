var delta = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
if(delta != 0){
	fps_display_timer = room_speed
	input_fps_index = clamp(input_fps_index+delta, 0, array_length_1d(fps_scales)-1);
	game_set_speed(input_start_fps*fps_scales[input_fps_index], gamespeed_fps);
}

fps_display_timer--;