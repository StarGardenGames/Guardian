var a = argument0;
log("Could not receive http request")
log("async_load:")
logMap(a)
if(ds_map_exists(a, "response_headers")){
    log("headers:")
    logMap(a[? "response_headers" ])
}