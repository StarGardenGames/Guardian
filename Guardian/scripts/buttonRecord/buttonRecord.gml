oRecord.state = RECORD_STATE.pre
oRecord.alarm[0] = 120
var obj;
switch(oPreview.sprite_index){
case sCharacterLeft: obj = oCharacterLeft; break;
case sCharacterRight: obj = oCharacterRight; break;
case sCharacterDown: obj = oCharacterDown; break;
case sCharacterUp: obj = oCharacterUp; break;
default: throwError("Invalid sprite", sprite_get_name(oPreview.sprite_index))
}
with(instance_create_depth(room_width/2, room_height/2, 0, obj)){
	state = CHAR_STATE.selected
	path_end()
}