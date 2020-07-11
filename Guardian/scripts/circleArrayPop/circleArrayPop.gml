/// @desc Remove element from end of CircleArray
/// @param arr Circle array

//Example
// arr: [1, 2, 3, 4, 5]
// circleArrayPop()
// arr: [1, 2, 3, 4]

var arr = argument0;

if(arr[CIRCLE.length] > 0){
	var item = circleArrayGet(arr, arr[CIRCLE.length]-1)
	arr[@ CIRCLE.length]--;
	return item;
}

return undefined;