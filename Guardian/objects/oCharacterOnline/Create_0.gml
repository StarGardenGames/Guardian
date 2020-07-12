event_inherited();

if(ds_list_size(oPersistent.global_records) > 0){
	record = oPersistent.global_records[| irandom(ds_list_size(oPersistent.global_records)-1) ]
}else{
	record = oPersistent.my_record	
}