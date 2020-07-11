/// @desc sets random seed
/// 

/* FAQ: uhm, dude why? Aren't the game maker random funcs perfectly fine?

see randomOne
*/

var seed = argument[0]

if(!variable_global_exists("_rand_offset")){
	globalvar _rand_offset;
	_rand_offset = irandom(10000)
}

_rand_offset = seed