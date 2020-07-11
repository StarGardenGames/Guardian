/// @desc Checks if value is in circle array
/// @param arr Circle array
/// @param val Value to search for

var arr = argument0;
var value = argument1;

for(var i = 0; i < arr[CIRCLE.length]; i++){
	if(circleArrayGet(arr, i) == value){
		return true;	
	}
}
return false;