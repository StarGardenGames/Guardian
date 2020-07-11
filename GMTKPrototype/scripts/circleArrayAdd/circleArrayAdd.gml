/// @desc Adds an element to the end of a circle array
/// @param arr Circle array
/// @param value Value to add

// if there's no space then the first element will be shifted away
//Example
// arr: [1, 2, 3, 4, 5]
// circleArrayAdd(6)
// arr: [2, 3, 4, 5, 6]

var arr = argument0;
var value = argument1;

if(arr[CIRCLE.length] == circleArrayMaxLength(arr)){
	arr[@ CIRCLE.start] = (arr[CIRCLE.start] + 1)%circleArrayMaxLength(arr);
}else{
	arr[@ CIRCLE.length]++;
}
circleArraySet(arr, arr[CIRCLE.length]-1, value); 