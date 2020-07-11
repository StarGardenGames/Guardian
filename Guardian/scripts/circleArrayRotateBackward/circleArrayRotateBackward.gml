/// @desc Cycles the array forward by one
/// @param arr Circle array

//Example
// arr: [1, 2, 3, 4, 5]
// circleArrayRotateBackward()
// arr: [5, 1, 2, 3, 4]

var arr = argument0;

var end_value = circleArrayGet(arr, arr[CIRCLE.length]-1);
arr[@ CIRCLE.start] = (arr[CIRCLE.start] - 1)%circleArrayMaxLength(arr);
circleArraySet(arr, 0, end_value);