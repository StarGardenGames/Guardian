var old_x = x;
var old_y = y;
switch(mouse_type){
case MOUSE_TYPE.desktop:
	//shift/scale mouse into gui space
	room_x = mouse_x / screenScale
	room_y = mouse_y / screenScale
	
	pressed = mouse_check_button_pressed(mb_left);
	held = mouse_check_button(mb_left);
	released = mouse_check_button_released(mb_left);
	break;
case MOUSE_TYPE.mobile:
	pressed = device_mouse_check_button_pressed(index, mb_left);
	held = device_mouse_check_button(index, mb_left);
	released = device_mouse_check_button_released(index, mb_left);
	if(pressed + held + released != 0){
		//shift/scale mouse into gui space
		room_x = device_mouse_x(index) / screenScale
		room_y = device_mouse_y(index) / screenScale
	}
	break;
case MOUSE_TYPE.tab:
	//update tabbing position
	if(keyboard_check_pressed(oInput.tab_key)){
		//find next tab pos
		repeat(2){ // this may need to be reran from the top if we reached the end of the button list
			var next_tab_x = undefined;
			var next_tab_y = undefined;
			var next_tab_pri = undefined;
			var cur_tab_pri = inputGetTabPri(x, y)
			with(oInputClickable){
				var button_x = x + ((inputClickableIsGUI())? camX() : 0) / screenScale;
				var button_y = y + ((inputClickableIsGUI())? camY() : 0) / screenScale;
				var button_pri = inputGetTabPri(button_x, button_y)
				if(interactable && 
				   posInView(button_x, button_y) && 
				   cur_tab_pri < button_pri && // check if it's better than the current position
				   (next_tab_pri == undefined || button_pri < next_tab_pri) // check if it's better than the current candidate
				){
					next_tab_x = button_x;
					next_tab_y = button_y;
					next_tab_pri = inputGetTabPri(next_tab_x, next_tab_y)
				}
			}
		
			// if we found a candidate break
			if(next_tab_x != undefined){
				x = camX() + next_tab_x;
				y = camY() + next_tab_y;
				break;
			}else{
				// if there weren't any tab options, exit
				if(x == camX()-1 && y == camY()-1){
					break;	
				// if there weren't anymore options after the current pos, reset tab pos and do next loop
				}else{
					x = camX()-1;
					y = camY()-1;
					continue;
				}
			}
		}
	}
	
	pressed = keyboard_check_pressed(oInput.enter_key)
	held = keyboard_check(oInput.enter_key)
	released = keyboard_check_released(oInput.enter_key)
	break;
}

moved = old_x != room_x || old_y != room_y;
gui_x = roomXtoGUI(room_x)
gui_y = roomYtoGUI(room_y)