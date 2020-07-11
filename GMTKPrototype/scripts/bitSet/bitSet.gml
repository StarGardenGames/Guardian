/// @desc Sets item in a binary index tree
/// @param bit bit structure
/// @param new_index
/// @param val the identity item (defaults to 0)

var bit = argument[0];
var new_index = argument[1];
var val = argument[2];

//we'll frequently be adding to the end so we'll handle that as a special case for efficiency
if(new_index >= bitSize(bit)){
	//ds_list_add has better performance that a straight access, so I'll set that
	var right = bitSize(bit)+1;
	while(right != new_index+1){
		ds_list_add(bit,bitRange(bit, right-bitFirstOne(right), right-1));
		bitMarkType(bit);
		right++;
	}
	ds_list_add(bit, script_execute(bit_sum_func, bitRange(bit, right-bitFirstOne(right), right-1), val));
	bitMarkType(bit);
}else{
	//look up values at points we'll be modifying ahead of time
	//  (otherwise updating earlier points will break the get operation for future points)
	var pts = ds_map_create();
	pts[? new_index ] = val;
	var right = new_index+1 + bitFirstOne(new_index+1)
	while(right <= bitSize(bit)){
		pts[? right-1] = bitGet(bit, right-1)
		right += bitFirstOne(right)
	}

	// update index and parents
	right = new_index +1
	while(right <= bitSize(bit)){
		var first_one = bitFirstOne(right);
		bit[| right] = script_execute(bit_sum_func, bitRange(bit, right-first_one, right-1), pts[? right-1]);
		right += first_one;
	}

	ds_map_destroy(pts);
}
