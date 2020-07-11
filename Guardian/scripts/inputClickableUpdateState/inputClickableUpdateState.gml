if(interactable){
	pressed = false;
	released = false;
	var start_held = held;
	held = false

	// loop through mouses
	ds_list_clear(mouse_list)
	var is_gui = inputClickableIsGUI();
	var x1 = inputClickableX1()
	var y1 = inputClickableY1()
	var x2 = inputClickableX2()
	var y2 = inputClickableY2()
	with(oInputMouse){
		var xx = (is_gui)? gui_x : room_x
		var yy = (is_gui)? gui_y : room_y
		if(other.click_shape_is_ellipse){
			var rx = abs((x2 - x1))/2
			var ry = abs((y2 - y1))/2
			var cx = (x1+x2) / 2
			var cy = (y1+y2) / 2
			if(point_distance(0, 0, (xx-cx)/rx, (yy-cy)/ry) < 1){
				ds_list_add(other.mouse_list, id);
			}
		}else{
			if(x1 < xx && xx < x2 && y1 < yy && yy < y2){
				ds_list_add(other.mouse_list, id);
			}
		}
	}
	hover = false;
	for(var i = 0; i < ds_list_size(mouse_list); i++){
		if(!start_held){
			pressed = pressed || mouse_list[| i].pressed;
		}
		
		if(pressed){
			pressed_room_x = mouse_list[| i].room_x
			pressed_room_y = mouse_list[| i].room_y
			pressed_gui_x = mouse_list[| i].gui_x
			pressed_gui_y = mouse_list[| i].gui_y	
			pressed_button_x = x
			pressed_button_y = y
		}
		
		// gui_drag w/o room_drag example: the room is locked to the mouse, but the mouse is moving
		var gui_drag = point_distance(
			pressed_gui_x, pressed_gui_y,
			mouse_list[| i].gui_x, mouse_list[| i].gui_y
		) > 30
		
		// room_drag w/o gui_drag example: we press while the room is scrolling w/ momentum, mouse isn't actually moving, but it is relative to the room
		var room_drag = point_distance(
			pressed_room_x, pressed_room_y,
			mouse_list[| i].room_x, mouse_list[| i].room_y
		) > 30
		
		// button_move w/o gui or room drag example: mouse isn't moving, room view isn't moving, but the button is (could be a similar scroll effect to the above example)
		var button_move = point_distance(
			pressed_button_x, pressed_button_y,
			x, y,
		) > 30
		
		mouse_dragged_since_press = anyTrue(
			mouse_dragged_since_press,
			gui_drag,
			room_drag and not is_gui, 
			button_move,
		)
	}
	
	if(pressed){
		hold_started_with_press = true
		mouse_dragged_since_press = false
	}
	
	if(!must_press_to_hold || hold_started_with_press){
		for(var i = 0; i < ds_list_size(mouse_list); i++){
			held = held || mouse_list[| i].held;
		}
	}
	
	// remove itemInArray for performance, https://trello.com/c/lP01YnHm/320-optimization
	var im = getInputMethod()
	var is_pc = im == INPUT_METHOD.keyboard or im == INPUT_METHOD.mouse
	for(var i = 0; i < ds_list_size(mouse_list); i++){
		var is_pc_mouse = mouse_list[|i].mouse_type == MOUSE_TYPE.desktop or mouse_list[|i].mouse_type == MOUSE_TYPE.tab
		if(is_pc and is_pc_mouse){
			hover = true;
		}
	}

	if(start_held and !held){
		if(not drag_release_enabled and mouse_dragged_since_press){
			released = false
		}else if(passive_release_enabled){
			released = true
		}else{
			// released can happen when the mouse is dragged off of the button, active_release represents an explicit mouse button release 
			for(var i = 0; i < ds_list_size(mouse_list); i++){
				released = anyTrue(
					released,
					mouse_list[| i].released
				)
			}
		}
		hold_started_with_press = false;
	}
	
	if(anyTrue(pressed, released, held, hover)){
		ds_priority_add(oInput.depth_pri, id, depth)
	}
}else{
	pressed = false
	released = false
	held = false
	hover = false;
}