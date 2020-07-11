/// @desc takes a string and strips the whitespace from either side
/// @param string string to strip
/// @param [strip_char] character to strip (defaults to " ")

var str = argument[0];
var strip_char = (argument_count == 2)? argument[1] : " ";

if(string_length(strip_char) > 1){
	throwError("strip_char must be a single character, (i.e. ", strip_char, " is wrong)")
}

// find first non strip char
var first_char = 1;
while(first_char < string_length(str) && string_char_at(str, first_char) == strip_char){
	first_char++;
}

// find last non strip char
var last_char = string_length(str)
while(last_char >= first_char && string_char_at(str, last_char) == strip_char){
	last_char--;	
}

// if it's all strip characters, return emtpy string
if(last_char < first_char){
	return ""	
// otherwise return first_char, last_char range
}else{
	return string_copy(str, first_char, last_char+1-first_char);
}