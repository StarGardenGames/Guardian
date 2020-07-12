urls = ds_map_create()
urls[? "path" ] = "https://08yawg1a3f.execute-api.us-east-1.amazonaws.com/prod"

request_ids = ds_map_create()
request_ids[? http_get(concat(urls[? "path"], "?op=get_path",)) ] = "get_path"

randomize()

my_record = ds_map_create()
ds_map_add_list(my_record, "xs", ds_list_create())
ds_map_add_list(my_record, "ys", ds_list_create())
my_record[? "type"] = 0
my_record[?"name"] = "YourName"

global_records = ds_list_create()

addInputMapping("left", [vk_left, ord("A")], INPUT_METHOD.keyboard)
addInputMapping("right", [vk_right, ord("D")], INPUT_METHOD.keyboard)
addInputMapping("up", [vk_up, ord("W")], INPUT_METHOD.keyboard)
addInputMapping("down", [vk_down, ord("S")], INPUT_METHOD.keyboard)
addInputMapping("slow", [ord("E")], INPUT_METHOD.keyboard)
addInputMapping("swap", [vk_space], INPUT_METHOD.keyboard)
addInputMapping("slow", [gp_shoulderrb], INPUT_METHOD.gamepad)
addInputMapping("swap", [gp_shoulderlb], INPUT_METHOD.gamepad)

addJoystickMapping("left", gp_axislh, -1)
addJoystickMapping("right", gp_axislh, 1)
addJoystickMapping("up", gp_axislv, -1)
addJoystickMapping("down", gp_axislv, 1)

print(room)
with(oInput){
	printMap(mappings[? INPUT_METHOD.keyboard ]);	
}

room_goto(rm_menu)
