/// @desc Takes a ds_list object and returns an array representation
/// @param ds_list object

var list = argument0;

var arr;

for(var i = ds_list_size(list)-1; i >= 0; i--){
	arr[i] = list[| i];	
}

return arr;