/// @desc returns a random integer within the range
/// @param start start of range (inclusive)
/// @param end end of range (exclusive)

/* FAQ: uhm, dude why? Aren't the game maker random funcs perfectly fine?

see randomOne
*/
var start = argument[0]
var t_end = argument[1] // end is a resrved variable :'(

return start + randomInt(t_end-start)