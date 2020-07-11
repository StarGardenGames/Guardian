/// @desc Concatenates given arguments into a string
/// @param arg1 First argument of series
/// @param arg2 Second argument of series
/// @param arg3 etc, this is a hack to make it look like var args in auto complete (same as choose())
/// @param ... If you know of a beter was to do this let me know
// Examples
// concat("Score: ",5) -> "Score: 5"

var str = "";
for(var i = 0; i < argument_count; i++){
    if(is_string(argument[i])){
        str = str + argument[i];
    }else{
        str = str + string(argument[i]);
    }
}

return str;
