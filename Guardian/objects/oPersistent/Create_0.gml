urls = ds_map_create()
urls[? "path" ] = "https://08yawg1a3f.execute-api.us-east-1.amazonaws.com/prod"

request_ids = ds_map_create()
request_ids[? http_get(concat(urls[? "path"], "?op=get_path",)) ] = "get_path"

xs = ds_list_create();
ys = ds_list_create();

randomize()
var abc = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
name = concat(
	abc[irandom(25)],
	abc[irandom(25)],
	abc[irandom(25)],
)
loaded_name = ""