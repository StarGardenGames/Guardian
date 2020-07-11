var instance = argument0;

// Buttons can never be stopped, since they're an input on their own
// Instaed you'll need to call oInputClickable.interactable = false
if(object_is_ancestor(instance.object_index, oInputClickable)){
	return true; 
// if input is locked, and we don't have priority, we don't have access
}else if(!ds_priority_empty(locks) && ds_priority_find_max(locks) != instance){
	return false;
// if we have a block on our input then no access
}else if(inputBlockersExist(instance)){
	return false;
}else{
	return true;	
}