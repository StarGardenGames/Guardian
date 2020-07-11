name = ""
urls = ds_map_create()
request_ids = ds_map_create()
urls[? "path" ] = "https://08yawg1a3f.execute-api.us-east-1.amazonaws.com/prod"
request_ids[? http_get(concat(urls[? "path"], "?op=get_path",)) ] = "get_path"

xs = ds_list_create();
ys = ds_list_create();