/// @desc returns a random number on the range [0, 1) (not including 1)

/* FAQ: uhm, dude why? Aren't the game maker random funcs perfectly fine?

well, yes and no. there's a key limitation listed in the random_set_seed docs

"""
NOTE:While this seed will give consistent results on each target platform, results 
may vary between platforms due to the different way each target works.
"""

this was a problem for me since I wanted to make a multi platform game, where levels
needed to be consistently generated from a seed

If this isn't a problem for you, feel free to use the game maker funcs
*/

return randomInt(10000) / 10000