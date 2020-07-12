var name = get_string("What's your name?", oRecord.record[? "name"])//show_question_async("What's your name?")

var max_l=10
if(string_length(name) > max_l){
	show_message(concat("Name is too long, max ", max_l, " letters"));
	exit
}

var bad_words = loadJsonFile("bad_words.json")
var bad_list = bad_words[? "default"]
if(ds_list_find_index(bad_list, string_lower(name))){
	show_message("Sorry that name didn't pass our filters, please try another one")	
	exit
}

oRecord.record[? "name"] = name