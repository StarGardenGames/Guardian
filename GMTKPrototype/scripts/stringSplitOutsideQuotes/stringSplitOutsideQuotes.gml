/// @desc this will split the string into an array, but it won't break on symbols within quotes
/// @param string string to split on (defaults to space)
/// @param [sep] separator string
/// @param [max_splits] the max number of splits
/* Examples
stringSplitOutsideQuotes("\"+\" + \"+\"", "+") == ["\"+\" , \"+\""]
*/

var input_string = argument[0];
var sep, max_splits;
if(argument_count >= 2){
	sep = argument[1];	
}else{
	sep = " ";	
}
if(argument_count >= 3){
	max_splits = argument[2];	
}else{
	max_splits = 99999999;	
}

// remove any quotes within quotes
input_string = string_replace(input_string, "\\\"", "(<QUOTE_PLACEHOLDER)>");

var quote_parts = stringSplit(input_string, "\"");
var output_parts = stringSplit(quote_parts[0], sep, max_splits);
var at_max_splits = false;

for(var i = 1; i < array_length_1d(quote_parts); i++){
	// inside quote
	if(i%2 == 1 || at_max_splits){
		// append full string to last item of output_parts
		output_parts[array_length_1d(output_parts)-1] = concat(
			output_parts[array_length_1d(output_parts)-1],
			"\"",
			string_replace(quote_parts[i], "(<QUOTE_PLACEHOLDER)>", "\\\""),
			"\""
		)
	}else{
		// append first subpart to last item of output_parts
		var quote_sub_parts = stringSplit(quote_parts[i], sep, max_splits - (array_length_1d(output_parts)-1));
		output_parts[array_length_1d(output_parts)-1] = concat(
			output_parts[array_length_1d(output_parts)-1],
			quote_sub_parts[0],
		)
		
		// add remaining elements to end of array
		if(array_length_1d(quote_sub_parts) > 1){
			array_copy(output_parts, array_length_1d(output_parts),
					   quote_sub_parts, 1, array_length_1d(quote_sub_parts)-1)
		}
				   
	}
}
return output_parts
