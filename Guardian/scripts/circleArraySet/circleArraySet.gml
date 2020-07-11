/// @desc Sets an element of a circle array
/// @param arr Circle array
/// @param index Which index to set
/// @param value Value for the index

var arr = argument0;
var index = argument1;
var value = argument2;

var in_range = 0 <= index && index < arr[CIRCLE.length];
if(in_range){
	arr[@ CIRCLE.header_size + (arr[CIRCLE.start] + index)%circleArrayMaxLength(arr)] = value;
}else{
	throwError(index,"outside of range [ 0 ,",arr[CIRCLE.length],")");
}