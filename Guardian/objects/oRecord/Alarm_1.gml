/// @description record -> post
state = RECORD_STATE.post
alarm[2] = 6*room_speed

oControl.input_enabled = false

// send request
var path_string = json_encode(record)
oPersistent.request_ids[? http_post_string(concat(oPersistent.urls[? "path"], "?op=add_path"),path_string) ] = "add_path"