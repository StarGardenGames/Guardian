/// @desc Reads a list from ini
/// @param section section to read the list from
/// @param key key to read the list from
var section = argument[0];
var key = argument[1];
if(argument_count == 3){
	def = argument[2];
}else{
	def = undefined	
}

var list = ds_list_create();
var list_str = ini_read_string(section, key, "");
if(list_str != ""){
	ds_list_read(list, list_str);
	ds_list_destroy(def);
	return list;
}else if(def){
	ds_list_destroy(list);
	return def;
}else{
	return list;	
}