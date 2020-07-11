/// @desc Returns angle which steps the current angle toward the target
/// @param {degrees} current angle we're currently at
/// @param {degrees} target angle we're headed towards
/// @param {degrees} step How many degrees we're stepping toward target
// rotateTowards(10, 100, 5) -> 15
// rotateTowards(10, 350, 5) -> 5
// rotateTowards(10, 12, 5) -> 12
var current = argument0;
var target = argument1;
var step = argument2;
//bound within (0,360)
current = (current + 360)%360;
target = (target + 360)%360;

//from how far current would need to rotate ( and what direction)
var delta = -angle_difference(current, target); 
// angle_difference is retarted :(
// returns delta such that source - delta = target
// I feel like any reasonable person would expect it to be source + delta = target

if(abs(delta) < step){
	current = target;
}else{
	current += sign(delta) * step;
}

return current;