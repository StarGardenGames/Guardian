var input_override = argument0;

setInputMethodOverride(input_override);

oInputExample.draw_overlay = false

// enable all buttons in override layer
layer_set_visible("InputOverrideButtons", false);
var elems = layer_get_all_elements("InputOverrideButtons");
for(var i = 0; i < array_length_1d(elems); i++){
	var button = layer_instance_get_instance(elems[i]);
	button.interactable = false;
}

// disable all buttons in Buttons layer
var elems = layer_get_all_elements("Buttons");
for(var i = 0; i < array_length_1d(elems); i++){
	var button = layer_instance_get_instance(elems[i]);
	button.interactable = true;
}

with(oInputPlayer){
	removeInputBlocker("override_menu")	
}