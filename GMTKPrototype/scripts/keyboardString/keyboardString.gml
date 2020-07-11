/// @desc Returns the equivalent of the built in keyboard_string argument (but it works with replay and recording)
with(oInput){
	return string_copy(full_keyboard_string, keyboard_string_index, string_length(full_keyboard_string));
}