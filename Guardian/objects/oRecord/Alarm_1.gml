/// @description Disable Recording
recording = false;

// send request
var root_map = ds_map_create()
ds_map_add_list(root_map, "xs", xs)
ds_map_add_list(root_map, "ys", ys)
root_map[? "name" ] = oPersistent.name
var path_string = json_encode(root_map)
ds_map_destroy(root_map)

oPersistent.request_ids[? http_post_string(concat(oPersistent.urls[? "path"], "?op=add_path"),path_string) ] = "add_path"

// leave room
room_goto(rm_menu);
