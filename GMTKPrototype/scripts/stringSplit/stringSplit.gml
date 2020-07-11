/// @desc Converts a string to a string list
/// @param str string to split
/// @param [sep] (optional) separator string to split on
/// @param [max_splits] (optional) max_splits to make

var input_string = argument[0];
var sep, max_splits;
if(argument_count >= 2){
	sep = argument[1];	
}else{
	sep = " ";	
}
if(argument_count >= 3){
	max_splits = argument[2];	
}else{
	max_splits = 99999999;	
}

var strs = [];
var split_count = 0;
var index = string_pos(sep, input_string);
while(index != 0 && split_count != max_splits){
	strs[split_count] = string_copy(input_string, 0, index-1);
	var new_start = index + string_length(sep)
	input_string = string_copy(input_string, new_start, string_length(input_string)+1-new_start)
	split_count++
	index=string_pos(sep, input_string);
}
strs[split_count] = input_string
return strs;