/// @desc Takes 2 arrays and returns a combine
/// @param {array} arr1
/// @param {array} arr2 
/// @param {array} arr3 etc, this is a hack to make it look like var args in auto complete (same as choose())
/// @param ... If you know of a beter was to do this let me know

var new_arr = []

for(var i = 0; i < argument_count; i++){
	array_copy(
		new_arr, array_length_1d(new_arr),
		argument[i], 0, array_length_1d(argument[i])
	)
}

return new_arr