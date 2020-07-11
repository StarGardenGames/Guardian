/// @desc Combines string array using the join string
/// @param [join] join string
/// @param arr string array to join
// Examples
// join(":: ",["a", "b"]) -> "a::b"
var j = (argument_count == 2)?argument[0]:"";
var arr = (argument_count == 2)?argument[1]: argument[0];

var str = "";
for(var i = 0; i < array_length_1d(arr); i++){
    if(is_string(arr[i])){
        str = str + arr[i];
    }else{
        str = str + string(arr[i]);
    }
	if(i != array_length_1d(arr)-1){
		str = str + j	
	}
}

return str;
