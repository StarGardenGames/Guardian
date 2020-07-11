/// @desc Returns a random number [0, 1) on a gaussian distribution
/// @param {int} [order] How many iterations for generating the curve

// More explanation
// Standard random() is a uniform distribution, so .01, .2, and .5 are all equally likely
// Gaussian means it's much more likely to be close to .5 that at the extremes of .01 or .99
// The distribution is also often called the normal distribution or bell curve

// I chose to call it gaussian because it makes me sound the smartest ;)
// Also gauss was a cool guy https://www.youtube.com/watch?v=Dd81F6-Ar_0

// The technique I'm using here is explaned in this vides ( starting at 6:03 ) 
// You can think of order as the number of dice I'm using, if you want it to look more gaussian
//		with a sharper peak, then increase the order

var order = (argument_count == 1)? argument[0] : 3;

var v = 0;

repeat(order){
    v += randomOne();
}

return v / order;
