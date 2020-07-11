/// @desc sets the size of the deadzone on joysticks
/// @param deadzone number between 0 (no deadzone) and 1 (full deadzone)
var thresh = argument0;
with(oInput){
	deadzone = thresh;
}