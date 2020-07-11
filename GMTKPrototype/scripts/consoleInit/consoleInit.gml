/// @desc inits the console object
/// @param [console_key] the key used to activate the console (C by default)

var console_key = (argument_count > 0)? argument[0] : ord("C");

if(!instance_exists(oConsole)){
	instanceCreate(oConsole)
}

oConsole.console_key = console_key;