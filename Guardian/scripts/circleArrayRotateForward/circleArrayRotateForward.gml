/// @desc Cycles the array forward by one
/// @param arr Circle array

//Example
// arr: [1, 2, 3, 4, 5]
// circleArrayRotateForward()
// arr: [2, 3, 4, 5, 1]

var arr = argument0;
if(circleArrayLength(arr) != 0){
	var start_value = circleArrayGet(arr, 0);
	arr[@ CIRCLE.start] = (arr[CIRCLE.start] + 1)%circleArrayMaxLength(arr);
	circleArraySet(arr, arr[CIRCLE.length]-1, start_value); 
}