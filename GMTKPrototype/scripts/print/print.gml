/// @desc Converts args to space separated list, and passes it to show_debug_message
/// @param arg1 First argument of series
/// @param arg2 Second argument of series
/// @param arg3 etc, this is a hack to make it look like var args in auto complete (same as choose())
/// @param ... If you know of a beter was to do this let me know
// This script is the exact same as log
// I use print for debugging, and regularly remove them using ctrl+shift+f
// I use log if I want it to stay around longer
var str = "";
for(var i = 0; i < argument_count; i++){
    
    if(is_string(argument[i]))
        str = str + argument[i];    
    else
        str = str + string(argument[i]); 
	str += " ";
}
show_debug_message(str);