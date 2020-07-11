var cmd = argument0;

var num_open = 0;
var num_close = 0;
var first_open = 0;
var prev_char = "";
for(var i = 1; i <= string_length(cmd); i++){
	if(string_char_at(cmd, i) == "("){
		if(num_open == 0) first_open = i;
		// order of operation (
		if(itemInArray(prev_char, ["", " ", "+", "-", "*", "/", "%"])){
			num_open++;
		// function (
		}else{
			num_close--;
		}
	}
	if(string_char_at(cmd, i) == ")"){
		num_close++;	
	}
	if(num_open > 0 && num_open == num_close && i - first_open > 1){
		var parens_result = consoleParseCmd(string_copy(cmd, first_open+1, (i-1)+1-(first_open+1)))
		return concat(
			string_copy(cmd, 1, first_open-1),
			// skip (
			is_string(parens_result)? concat("\"", parens_result, "\"") : parens_result,
			// skip )
			string_copy(cmd, i+1, string_length(cmd)+1-(i+1)),
		);
	}
	prev_char = string_char_at(cmd, i)
}

// this means it was a funciton (ex. show_message("hello")
return cmd