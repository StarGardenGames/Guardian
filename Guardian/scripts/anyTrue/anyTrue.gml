/// @desc takes variable list of true/false arguments, and returns true if any of them are true
/// @param arg1 First argument of series
/// @param arg2 Second argument of series
/// @param arg3 etc, this is a hack to make it look like var args in auto complete (same as choose())
/// @param ... If you know of a beter was to do this let me know

var output = false;
for(var i = 0; i < argument_count; i++){
	output = output || argument[i];	
}
return output;