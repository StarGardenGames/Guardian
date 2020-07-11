/// @desc returns a random integer within the range
/// @param range upper bound for the integer

/* FAQ: uhm, dude why? Aren't the game maker random funcs perfectly fine?

see randomOne
*/
var range = argument[0]

randomIncSeed()

return randomGetSeed() % range