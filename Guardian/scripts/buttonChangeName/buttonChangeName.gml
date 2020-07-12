var name = get_string("What's your name?", oRecord.record[? "name"])//show_question_async("What's your name?")
name = string_lower(name)

var max_l=10
if(string_length(name) > max_l){
	show_message(concat("Name is too long, max ", max_l, " letters"));
	exit
}

if(string_pos(" ", name) != 0){
	show_message("Name cannot contain spaces")
	exit
}

var bad_words = loadJsonFile("bad_words.json")
var bad_list = bad_words[? "default"]
if(ds_list_find_index(bad_list, name)){
	show_message("Sorry that name didn't pass our filters, please try another one")	
	exit
}

oPersistent.my_record[? "name"] = name