/// @description pre -> record
alarm[1]=3*room_speed; //disables recording
state = RECORD_STATE.record
ds_list_clear(record[? "xs"])
ds_list_clear(record[? "ys"])
