//// MAPPING CODE ////

// keyboard mapping
addInputMapping("left", [vk_left, ord("A")], INPUT_METHOD.keyboard)
addInputMapping("right", [vk_right, ord("D")], INPUT_METHOD.keyboard)
addInputMapping("up", [vk_up, ord("W")], INPUT_METHOD.keyboard)
addInputMapping("down", [vk_down, ord("S")], INPUT_METHOD.keyboard)
addInputMapping("shoot", vk_space, INPUT_METHOD.keyboard)
addInputMapping("restart", ord("R"), INPUT_METHOD.keyboard)

// gamepad (and remote) mapping
addJoystickMapping("left", gp_axislh, -1)
addJoystickMapping("right", gp_axislh, 1)
addJoystickMapping("up", gp_axislv, -1)
addJoystickMapping("down", gp_axislv, 1)
addInputMapping("shoot", gp_face1, INPUT_METHOD.gamepad)
addInputMapping("restart", gp_face2, INPUT_METHOD.gamepad)

// keyboard hot key mapping
addInputMapping("record", ord(1), INPUT_METHOD.keyboard)
addInputMapping("change_input_method", ord(2), INPUT_METHOD.keyboard)
addInputMapping("replay", ord(3), INPUT_METHOD.keyboard)

// mobile

// I've added the arrow buttons directly in the room (it's easier that way)
// but I've added the shoot/restart buttons here to give you an example of how you'd add it in code

with(addInputClickable("shoot", -200, -200, 0, 0, oInputMobileButton, ANCHOR.screen_bottom_right)){
	sprite_index = sActionIcon
}
with(addInputClickable("restart", -200, 0, 0, 200, oInputMobileButton, ANCHOR.screen_top_right)){
	sprite_index = sRestartIcon
}

//// Text ////
instructions = setMapDefaults(ds_map_create(),
	INPUT_METHOD.mouse, "Move the mouse to move the player, and click to shoot",
	INPUT_METHOD.keyboard, "Use the arrow keys and space to control the player",
	INPUT_METHOD.gamepad, "Use the left joystick to move the player, and the A button to shoot",
	INPUT_METHOD.mobile, "Use the buttons on the bottom to control the player",
	INPUT_METHOD.remote, "Use the pad to move the player, and press down to shoot",
)

tips = [
	"On desktop, you can use tab/enter to select buttons without the mouse",
	"The main 3 buttons also have hotkey mappings of 1,2,3",
	"The input recording system can also record keyboard_string (although it's not demoed here)",
	"I'm hoping the record/replay system can be used to help with game testing",
	"By default desktop will automatically switch between gamepad, or keyboard depending on what it detects, but you can change this behaviour with setPrimaryDesktopInputMethods (or even add mouse)",
	"When you're replaying input you can use the arrow keys to alter the playback speed",
	"Try resizing the screen while in mobile mode. The buttons will adjust their position accordingly",
];
randomize()
tip_index = irandom(array_length_1d(tips)-1)

//// MISC ////
draw_overlay = false;

dialog_events =  ds_map_create();	