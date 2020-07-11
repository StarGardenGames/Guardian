var m = argument0;
log("{")
for(var key=ds_map_find_first(m); key != undefined; key=ds_map_find_next(m, key)){
	log("    ", key, ":", m[? key ])	
}
log("}")