/// @desc Randomly returns the index of 1 of the params, weighted by given weighting
/// @param {array} weights array of weights
// Examples
// choose(1, 1, 1) -> equivalent of choose(0, 1, 2)
// chooseWeighted(2,1,1) -> 0 50% of the time, 1 25% of the time, and 2 25% of the time

var sum = 0;
for(var i = 0; i < argument_count; i++){
	sum += argument[i];
}

var r = randomOne()*sum;

sum = 0;
var i = 0;
while(sum+argument[i] < r){
	sum += argument[i];
	i++;
}
return i;