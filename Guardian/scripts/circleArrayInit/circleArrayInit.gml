/// @desc Returns a circle array with given length
/// @param max_length max length of array

//Further Description
// https://www.youtube.com/watch?v=g9su-lnW2Ks
// Useful when I only want to keep the x most recent occurances

enum CIRCLE{
	length,
	start,
	header_size
};

var max_length = argument0;

var arr;
arr[CIRCLE.length] = 0;
arr[CIRCLE.start] = 0;

for(var i = CIRCLE.header_size; i < CIRCLE.header_size + max_length; i++){
	arr[i] = 0;	
}

return arr;