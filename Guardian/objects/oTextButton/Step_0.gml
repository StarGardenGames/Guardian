event_inherited();

if(room == rm_menu){
	interactable = (anchor_obj == oLevelSelect)? oLevelSelect.enabled : !oLevelSelect.enabled;
}

if(room == roomPathRecord and script == buttonRecord){
	interactable = oPersistent.my_record[? "name"] != ""
}