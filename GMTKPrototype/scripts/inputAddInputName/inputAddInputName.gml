var input_name = argument0;

if(!instance_exists(oInput)){
	instanceCreate(oInput)	
}

with(oInput){

	if(ds_list_find_index(all_input_names, input_name) == -1){
		ds_list_add(all_input_names, input_name)
	}
}