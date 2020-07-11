/// @desc Takes a array object and returns a list representation
/// @param arr object

var arr = argument0;

var list = ds_list_create();

for(var i = 0; i < array_length_1d(arr); i++){
	ds_list_add(list, arr[i]);
}

return list;