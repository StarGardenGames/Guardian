var list_r = argument0;
var list_l = argument1;

var output = ds_list_create();

//var implied_sub = max(0, string_length(list_l[|2]) - string_length(list_r[|2]))

var s_right = list_r[| 2]; // string component of the list
var s_left = list_l[| 2]; // string component of the list
var diff;
var implied_sub = 0

// apply the backspace count from the right side first
while(!(s_left == "" || string_pos(s_left, s_right) == 1)){
	s_left = string_copy(s_left, 1, string_length(s_left)-1)
	implied_sub++;
}

// diff the remaining strings
if(s_left == ""){
	diff = s_right
}else{
	diff = string_replace(s_right, s_left, "")	
}

// creating a new list
ds_list_add(
	output, 
	max(list_r[|0], list_l[|0]), //input_frame
	implied_sub + list_r[|1]-list_l[|1], // remaining backspaces
	diff
)

return output;
