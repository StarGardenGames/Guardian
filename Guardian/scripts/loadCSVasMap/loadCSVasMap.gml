/// @desc Takes a csv file name with csv data and outputs a ds_map structure
/// @param {string} filename The name of the file with the CSV data
/// @param {string} (primary_key) The column to use as the primary map key
/* Example

Input CSV (with first row being titles):

name, age, height_cm
bob, 26, 180
katie, 35, 150

output:

{
    bob: {name: bob, age: 26, c: 180},
    katie: {name: katie, age: 35, c: 150}
}
*/

var file = argument[0];
var primary_key_name = (argument_count == 2)? argument[1] : "";

var grid = load_csv(file);

// load keys
var keys;
var primary_key = undefined; 
for(var j = 0; j < ds_grid_width(grid); j++){
	keys[j] = grid[# j, 0]
	if(keys[j] == primary_key_name){
		primary_key = j;
	}
}

if(primary_key == undefined){
	if(primary_key_name == ""){
		primary_key	= 0
	}else{
		throwError("Could not find title ", primary_key_name, " in csv")
	}
}

// load items
var base_map = ds_map_create();
for(var i = 1; i < ds_grid_height(grid); i++){
	var item = ds_map_create();
	for(var j = 0; j < ds_grid_width(grid); j++){
		item[? keys[j] ] =	grid[# j, i];
	}
	ds_map_add_map(base_map, grid[# primary_key, i], item)
}

return base_map