/// @desc Takes the name of a JSON file and a map, and writes it to the file
/// @param {string} filename The name of the file with the JSON data
/// @param {string} map The name of the map to write
var filename = argument0;
var map = argument1;

var file = file_text_open_write(filename);

var json_str = json_encode(map);

if(json_str == undefined){
	throwError("map could not be encoded to json");	
}

file_text_write_string(file, json_str);

file_text_close(file);
