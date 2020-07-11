/// @desc sets random seed
/// 

/* FAQ: uhm, dude why? Aren't the game maker random funcs perfectly fine?

see randomOne
*/
if(!variable_global_exists("_rand_offset")){
	globalvar _rand_offset;
	_rand_offset = irandom(10000)
}

return _rand_offset 