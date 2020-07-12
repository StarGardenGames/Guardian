/// @description Insert description here
// You can write your code in this editor

currenttime -= dt*oMovingObject.slowfactor/room_speed
if(currenttime <= 0){
	currenttime = 0
	oControl.level_state = LEVEL_STATE_2.won
}