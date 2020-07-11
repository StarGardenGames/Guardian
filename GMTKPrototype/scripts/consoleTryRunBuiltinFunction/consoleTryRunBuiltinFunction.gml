/// @desc Take a built in function name and tries to run it (I'm sad this function has to exists, but there's no asset_get_index() for built in functions :'( )
/// @param func name of built in function
/// @param args array of arguments for the function

var func = argument0;
var args = argument1;

switch(func){
case "room_goto":
	room_goto(args[0]);
	break;
case "room_restart":
	room_restart();
	break;
case "make_color_rgb":
	return make_color_rgb(args[0], args[1], args[2]);
case "min":
	switch(array_length_1d(args)){
	case 1: return min(args[0]);
	case 2: return min(args[0], args[1]);
	case 3: return min(args[0], args[1], args[2]);
	case 4: return min(args[0], args[1], args[2], args[3]);
	case 5: return min(args[0], args[1], args[2], args[3], args[4]);
	default:
		show_message_async(concat(
			"Unsupported # of arguments for: ",
			func, 
			" (you can update consoleTryRunBuiltinFunction to add more)",
		))
	}
	break;
case "max":
	switch(array_length_1d(args)){
	case 1: return max(args[0]);
	case 2: return max(args[0], args[1]);
	case 3: return max(args[0], args[1], args[2]);
	case 4: return max(args[0], args[1], args[2], args[3]);
	case 5: return max(args[0], args[1], args[2], args[3], args[4]);
	default:
		show_message_async(concat(
			"Unsupported # of arguments for: ",
			func, 
			" (you can update consoleTryRunBuiltinFunction to add more)",
		))
	}
	break
case "abs":
	return abs(args[0])
case "sign":
	return sign(args[0])
case "sqr":
	return sqr(args[0])
case "sqrt":
	return sqrt(args[0])
case "ceil":
	return ceil(args[0])
case "floor":
	return floor(args[0])
case "clamp":
	return clamp(args[0], args[1], args[2])
case "instance_create_depth":
	instance_create_depth(args[0], args[1], args[2], args[3])
	break;
case "instance_create_layer":
	instance_create_layer(args[0], args[1], args[2], args[3])
	break;
default:
	show_message_async(concat(
		"Unrecognized function: ",
		func, 
		" (if it's a built in function, you may need to update consoleTryRunBuiltinFunction)",
	))
}

return "";