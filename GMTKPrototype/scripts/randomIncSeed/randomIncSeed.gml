/// @desc increments seed

/* FAQ: uhm, dude why? Aren't the game maker random funcs perfectly fine?

see randomOne
*/

var p = [18229, 21937, 22621]

randomSetSeed((randomGetSeed()*p[0]+p[1])% p[2])