/// @desc Executes a script with the given array arguments
/// @param script script to execute
/// @param args array of arguments to pass to the script

var script = argument0;
var args = argument1;
switch(array_length_1d(args)){
case 0: script_execute(script); return;
case 1: script_execute(script, args[0]); return;
case 2: script_execute(script, args[0], args[1]); return;
case 3: script_execute(script, args[0], args[1], args[2]); return;
case 4: script_execute(script, args[0], args[1], args[2], args[3]); return;
case 5: script_execute(script, args[0], args[1], args[2], args[3], args[4]); return;
case 6: script_execute(script, args[0], args[1], args[2], args[3], args[4], args[5]); return;
default:
	throwError("Currently 6 is the max number of supported arguments (but it's not hard to add more!)")
}