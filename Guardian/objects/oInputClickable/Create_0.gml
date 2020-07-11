event_inherited()

draw_debug = false;
pressed = false;
held = false;
released = false;
hover = false;

mouse_list = ds_list_create();

debug_color = make_color_hsv(128+random(128), 255, 255);

interactable = true;

drag_release_enabled = true; // if the screen/button/room was dragged before release, does it count?
passive_release_enabled = true; // a passive release is when the user clicks the button and then drags of the button
can_click_through = false; // whether overlapping buttons can also be pressed

mouse_dragged_since_press = false
pressed_room_x = 0;
pressed_room_y = 0;
pressed_gui_x = 0;
pressed_gui_y = 0;
pressed_button_x = 0
pressed_button_y = 0

hold_started_with_press = false
must_press_to_hold = true;

image_speed = 0

if(sprite_index == -1){
	x1 -=  100 / 2
	y1 -= 100 / 2
	x2 = x1 + 100
	y2 = y1 + 100
}else{
	x1 -= sprite_xoffset
	y1 -= sprite_yoffset
	x2 = x1 + sprite_width
	y2 = y1 + sprite_height
}

var min_x = min(x1, x2)
var max_x = max(x1, x2)
x1 = min_x
x2 = max_x
var min_y = min(y1, y2)
var max_y = max(y1, y2)
y1 = min_y
y2 = max_y

click_shape_is_ellipse = false

// update all_input_names in case it input_name was set in the room
if(input_name != ""){
	if(is_real(input_name)){
		addInputMapping(input_name, input_name, INPUT_METHOD.keyboard)
	}
	inputAddInputName(input_name)
}