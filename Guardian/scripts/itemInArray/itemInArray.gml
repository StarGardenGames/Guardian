/// @desc Takes an arbitrary item, and an array, and returns true if the item is in the array 
/// @param item item to test in array
/// @param {array} arr arr of items

var item = argument0;
var arr = argument1;
for(var i = 0; i < array_length_1d(arr); i++){
    if(item == arr[i]){
        return true;
    }
}

return false;
