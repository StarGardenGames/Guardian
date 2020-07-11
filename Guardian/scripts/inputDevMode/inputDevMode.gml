/// @desc returns (and maybe sets) the input dev mode
/// @param [dev_mode] option true/false for new devmode value

if(!instance_exists(oInput)){ instanceCreate(oInput) }

if(argument_count == 1){
	oInput.dev_mode = argument[0]
}

return oInput.dev_mode;