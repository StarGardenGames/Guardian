/// @desc Release input lock so that other instances can access input
with(oInput){
	ds_priority_delete_value(locks, other.id);	
}