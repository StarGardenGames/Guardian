/// @description Insert description here
// You can write your code in this editor

currenttime -= dt*oMovingObject.slowfactor/room_speed
if(currenttime <= 0){
	currenttime = 0
	if(room == oPersistent.levels[0]){
		room_goto(roomPathRecord)	
	}else{
		room_goto(rm_menu)
	}
}