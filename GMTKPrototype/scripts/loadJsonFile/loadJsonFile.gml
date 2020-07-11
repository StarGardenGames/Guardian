/// @desc Takes the name of a JSON file and converts it to a map
/// @param {string} filename The name of the file with the JSON data
var filename = argument0;

var file = file_text_open_read(filename);
if(file == undefined){
	throwError("Couldn't find json file",filename);	
}

var str = "";
while(!file_text_eof(file)){
	str += file_text_readln(file);
}

file_text_close(file);

var output = json_decode(str);
if(output == -1){
	throwError(str, "could not be decoded");
}else{
	return output;	
}