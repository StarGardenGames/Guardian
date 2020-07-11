var list1 = argument0;
var list2 = argument1;

var overflow = max(0,list2[|1] - string_length(list1[|2]))

var output = ds_list_create();
ds_list_add(
	output, 
	max(list1[|0], list2[|0]), //input_frame
	list1[|1] + overflow, // remaining backspaces
	concat( //combine string (accounting for backspace)
		(overflow == 0)? string_copy(list1[|2],1,string_length(list1[|2]) - list2[|1]) : "",
		list2[|2]
	)
)

return output;
