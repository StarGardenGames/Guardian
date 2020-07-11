/// @desc this will count the number of substring occurances not including what's within the quotes
/// @param substring substring to count
/// @param string string to search int
/* Examples
stringCountOutsideQuotes("+", "\"+\" + \"+\"") == 1
*/

var subStr = argument0;
var str = argument1;

// remove any quotes within quotes
str = string_replace(str, "\\\"", "");

var count = 0;
var parts = stringSplit(str, "\"");
for(var i = 0; i < array_length_1d(parts); i++){
	if(i%2 == 1) continue; // the odd items are within strings, so skip them
	count += string_count(subStr, parts[i])
}
return count;
