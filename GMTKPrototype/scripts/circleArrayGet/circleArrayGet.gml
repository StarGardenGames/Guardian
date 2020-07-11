/// @desc Returns element of circle array
/// @param arr Circle array
/// @param index Which index to retrieve

var arr = argument0;
var index = argument1;

var in_range = 0 <= index && index < arr[CIRCLE.length];
if(in_range){
	return arr[CIRCLE.header_size + (arr[CIRCLE.start] + index)%circleArrayMaxLength(arr)];
}else{
	throwError(index,"outside of range [ 0 ,",arr[CIRCLE.length],")");
}

