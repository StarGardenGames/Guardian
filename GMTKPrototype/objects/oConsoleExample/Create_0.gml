consoleInit();

cmds = [
	"Press C to open the console, then try the following\noConsoleBox1.x = 100",
	"oConsoleBox2.y -= 96",
	"oConsoleText3.text",
	"oConsoleBox4.image_blend = c_white",
	"oConsoleText5.text += \"                   \"",
	"oConsoleBox6.image_blend=makeColorGray(50)",
	"good job!, next try room_restart();",
]

box_width = 500
box_height = 64
gap = 32

var top_x = room_width/2
var top_y = room_height/2 +(gap/2)- ((box_height+gap)*array_length_1d(cmds))/2

var objs = []
var txts = []

for(var i = 0; i < array_length_1d(cmds);i++){
	var yy = top_y+i*(box_height+gap)
	txts[i] = instance_create_depth(
		top_x, yy, 1,  asset_get_index(concat("oConsoleText", i))
	)
	txts[i].text = cmds[i];
	
	if( i != 0){
		objs[i] = instance_create_depth(
			top_x, yy, 0, 
			asset_get_index(concat("oConsoleBox", i))
		);
	}
}

txts[4].is_gui = true;
txts[4].image_blend = objs[4].image_blend;

txts[6].is_gui = true;
txts[6].image_blend = objs[6].image_blend;