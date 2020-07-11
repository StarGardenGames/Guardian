/// @desc Performs binary search on a ds_list structure
/// @param resource resource to search (assumed to be list)
/// @param val value to search for
/// @param [res_get_func] script to retrieve item from resource (list get by default)
/// @param [left] left side of search range, inclusive (defaults to 0)
/// @param [right] right side of search range, exclusive (defaults to size of list)

var res = argument[0];
var val = argument[1];
var res_get_func = (argument_count >= 3)? argument[2] : binarySearchDefaultStructGet;
var precision = (argument_count >= 4)? argument[3] : 1
var left_index = (argument_count >= 5)? argument[4] : 0;
var right_index = (argument_count >= 6)? argument[5] : ds_list_size(res);

// if the value isn't in the range return undefined
if(val < script_execute(res_get_func, res, left_index) || script_execute(res_get_func, res, right_index) < val){
	return undefined
}

//give result regardless of whether it's equal, I just want the closest
if((right_index - left_index) <= precision){
	return left_index;
}

var half_index = (right_index + left_index) / 2
 
if(script_execute(res_get_func, res, half_index) > val){
	return binarySearch(res, val, res_get_func, left_index, half_index);
}else{
	//I'm keeping half_index included because it could still be the largest value that's not greater than
	return binarySearch(res, val, res_get_func, half_index, right_index);
}
