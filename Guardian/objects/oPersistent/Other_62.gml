if(ds_map_exists(async_load, "http_status") and async_load[? "http_status" ] != 200){
    logHTTPError(async_load)
    exit;
}

switch(request_ids[? async_load[? "id"]]){
case "get_path": 
    if(ds_map_find_value(async_load, "status") == 0){
		var path_map = json_decode(async_load[? "result" ])
		ds_list_add(global_records, path_map)
    }else{
        log(request_ids[? async_load[? "id"]])
        logHTTPError(async_load)
    }
    break;
}