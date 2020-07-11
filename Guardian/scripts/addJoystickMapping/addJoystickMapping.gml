/// @desc Adds a mapping for a joystick
/// @param input_name Which input to map the job stick to (usually vk_* but can also be custom string)
/// @param axis Which joystick axis to map (some gp_axis* constant)
/// @param dir Which direction to map the key to (either -1 or 1)

var input_name = argument0;
var axis = argument1;
var dir = argument2;

with(oInput){
	if(!itemInArray(dir, [-1, 1])){
		throwError("dir must be -1 or 1");
	}
	
	var map = dir == -1 ? neg_stick_mappings : pos_stick_mappings;

	map[? axis ] = input_name;
	inputAddInputName(input_name)
}