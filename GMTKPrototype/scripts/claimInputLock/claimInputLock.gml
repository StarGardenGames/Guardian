/// @desc adds an input lock for the current instance, this disables input for all objects except the current one
if(!instance_exists(oInput)) instanceCreate(oInput)

with(oInput){
	var new_pri = 0
	if(ds_priority_find_priority(locks, other.id) != undefined){	
		new_pri = ds_priority_find_priority(locks, ds_priority_find_max(locks)) + 1
	}
	ds_priority_add(locks, other.id, new_pri+1);
}