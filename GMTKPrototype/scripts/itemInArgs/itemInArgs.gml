/// @desc Takes an arbitrary item, and a series of args, and returns if the item is in the args
/// @param item item to test in array
/// @param arg1
/// @param arg2
/// @param ...

var item = argument[0];
for(var i = 1; i < argument_count; i++){
	if(item == argument[i]){
		return true	
	}
}
return false;