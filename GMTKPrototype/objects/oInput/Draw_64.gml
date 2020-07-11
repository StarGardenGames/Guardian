if(fps_display_timer > 0){
	draw_set_color(c_white);
	var tri_size = 64;
	var center_left_y = camH() - 10 - tri_size;
	for(var i = 0; i <= input_fps_index-1; i++){
		var center_left_x = 10 + i*tri_size;
		draw_triangle(
			center_left_x,
			center_left_y-tri_size/2,
			center_left_x,
			center_left_y+tri_size/2,
			center_left_x+tri_size,
			center_left_y,
			false
		)
	}
}