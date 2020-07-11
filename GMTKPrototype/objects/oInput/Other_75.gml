switch(async_load[? "event_type"]){
case "gamepad discovered":
	gamepad_count++;
	break;
case "gamepad lost":
	gamepad_count--;
	break;
}