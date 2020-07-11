recording = false;

xs = ds_list_create();
ys = ds_list_create();

path = pathRecord;
path_clear_points(path);
alarm[0] = 90;

with(oCharacter){
	selected = true;
	path_end();
}