//supported ops
// some_func()
// obj.var = val
// obj.var += val
// var
// val
var cmd = strip(argument0);

switch(stringCountOutsideQuotes("=", cmd)){
//value (or equation)
case 0:
	var cmd_with_parens_parsed = consoleReplaceInnerParens(cmd)
	//function
	var paren_pos =string_pos("(", cmd)
	if(paren_pos != 0 && (paren_pos == 1 || !itemInArray(string_char_at(cmd, paren_pos-1), [" ", "*", "/", "+", "-"]))){
		var parts = stringSplit(cmd, "(", 1);
		var func = parts[0];
		var arg_string = string_copy(parts[1], 0, string_length(parts[1])-1)
		var args;
		if(arg_string == ""){
			args = []	
		}else{
			args = stringSplit(arg_string, ",");
			for(var i = 0; i < array_length_1d(args); i++){
				args[i] = consoleParseCmd(args[i]);
			}
		}
		var scr = asset_get_index(func);
		if(script_exists(scr)){
			return scriptExecuteWithArrayArgs(scr, args)
		}else{
			return consoleTryRunBuiltinFunction(func, args)
		}
	// parenthesis
	}else if(cmd_with_parens_parsed != cmd){ // if it's a function or there aren't any parens, the output will be the same
		return consoleParseCmd(cmd_with_parens_parsed)
	// multiply
	}else if(stringCountOutsideQuotes("*", cmd) >= 1){
		var parts = stringSplitOutsideQuotes(cmd, "*", 1);
		return consoleParseCmd(parts[0]) * consoleParseCmd(parts[1])
	// divide
	}else if(stringCountOutsideQuotes("/", cmd) >= 1){
		var parts = stringSplitOutsideQuotes(cmd, "/", 1);
		return consoleParseCmd(parts[0]) / consoleParseCmd(parts[1]);
	// add
	}else if(stringCountOutsideQuotes("+", cmd) >= 1){
		var parts = stringSplitOutsideQuotes(cmd, "+", 1)
		for(var i = 0; i < 2; i++){
			parts[i] = consoleParseCmd(parts[i])
		}
		if(is_real(parts[0]) and is_real(parts[1])){
			return parts[0] + parts[1]	
		}else{
			return concat(parts[0], parts[1])
		}
	// subtract
	}else if(stringCountOutsideQuotes("-", cmd)){
		var parts = stringSplitOutsideQuotes(cmd, "-", 1);
		return ((parts[0] == "")? 0 : consoleParseCmd(parts[0])) - consoleParseCmd(parts[1]);
	//string
	}else if(string_char_at(cmd, 1) == "\"" and string_char_at(cmd, string_length(cmd)) == "\""){
		return string_replace(string_copy(cmd, 2, string_length(cmd)-2), "\\\"", "\"");
	//real
	}else if(itemInArray(string_char_at(cmd,1),["-",".","0","1","2","3","4","5","6","7","8","9"])){
		return real(cmd);
	//asset
	}else if(asset_get_index(cmd) != -1){
		return asset_get_index(cmd);
	//variable
	}else{
		var dot_parts = stringSplit(cmd, ".");
		switch(array_length_1d(dot_parts)){
		//global
		case 1: 
			if(variable_global_exists(cmd)){
				return variable_global_get(cmd); 
			}else{
				show_message_async(concat("couldn't find global variable ",cmd));	
			}
			break;
		//instance
		case 2: 
			var inst = asset_get_index(dot_parts[0])
			if(inst == -1) show_message_async(concat("Object", dot_parts[0], "does not exist"))
			inst = inst.id
			if(variable_instance_exists(inst, dot_parts[1])){
				return variable_instance_get(inst, dot_parts[1]);
			}else{
				show_message_async(concat("couldn't find instance variable ",cmd));	
			}
			break;
		default: show_message_async(concat("too many dots in variable name ", cmd));
		}
	}
	break;
//equals
case 1:
	var eq_parts = stringSplit(cmd, "=");
	var variable = strip(string_copy(eq_parts[0], 0, string_length(eq_parts[0])-1));
	var operator = strip(string_char_at(eq_parts[0], string_length(eq_parts[0]))); 
	if(!itemInArray(operator, ["+", "-", "*", "/", "%"])){
		variable = concat(variable, operator);
		operator = "";
	}
	
	// compute new value
	var var_val = consoleParseCmd(variable)
	var adj_val = consoleParseCmd(eq_parts[1])
	switch(operator){
		case "+": var_val += adj_val; break;
		case "-": var_val -= adj_val; break;
		case "*": var_val *= adj_val; break;
		case "/": var_val /= adj_val; break;
		case "%": var_val %= adj_val; break;
		default: var_val = adj_val; 
	}
	
	// update variable
	// global
	if(string_count(".", variable) == 0){
		variable_global_set(variable, var_val);
	// instance
	}else{
		var dot_parts = stringSplit(variable, ".");
		var obj = asset_get_index(dot_parts[0])
		var inst = obj.id
		var var_name = dot_parts[1];
		variable_instance_set(inst, var_name, var_val)
	}
	break;
default:
	show_message_async("Only 1 equals sign is allowed");
}

return ""