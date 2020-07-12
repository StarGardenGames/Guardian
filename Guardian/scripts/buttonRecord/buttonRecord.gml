oRecord.state = RECORD_STATE.pre
oRecord.alarm[0] = 120
with(instance_create_depth(room_width/2, room_height/2, 0, oCharacterLocal)){
	state = CHAR_STATE.selected
	path_end()
}