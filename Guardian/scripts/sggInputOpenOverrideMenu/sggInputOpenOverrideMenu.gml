oInputExample.draw_overlay = true

// enable all buttons in override layer
layer_set_visible("InputOverrideButtons", true);
var elems = layer_get_all_elements("InputOverrideButtons");
for(var i = 0; i < array_length_1d(elems); i++){
	var button = layer_instance_get_instance(elems[i]);
	button.interactable = true;
}

// disable all buttons in Buttons layer
var elems = layer_get_all_elements("Buttons");
for(var i = 0; i < array_length_1d(elems); i++){
	var button = layer_instance_get_instance(elems[i]);
	button.interactable = false;
}

with(oInputPlayer){
	addInputBlocker("override_menu")
}