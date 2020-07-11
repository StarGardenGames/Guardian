draw_set_color(c_white)
draw_text(20, 30, "USE\nMOUSE\nTO\nPAN")
draw_text(20, 180, "THERE\nARE\nALSO\nEXAMPLES\nIN\nTHE\nSCRIPTS")

for(var e = 0; e < array_length_1d(examples); e++){
	var xx = 100 + (e div 2) * 360;
	var yy = (e % 2) * 360;
	draw_set_color(sgg_red)
	drawRectOutline(xx+1, yy+1, xx+359, yy+359, 6)
	draw_set_color(c_white)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_text(xx+10, yy+10, is_real(examples[e])? script_get_name(examples[e]) : examples[e])
	switch(examples[e]){
	case "roundedRect, drawArc, ...":
		draw_set_color(c_white)
		drawSlice(xx+180, yy+180, 120, 0, 180, 0, 32)
		drawRoundedRect(xx+80, yy+140, xx+280, yy+330, 20, 10)
		drawWideLine(xx+100, yy+200, xx+160, yy+230, 20, 0, 5)
		drawWideLine(xx+260, yy+200, xx+200, yy+230, 20, 0, 5)
		drawArc(xx+180, yy+220, 80, 200, 340)
		break;
	case rotateTowards:
		var cy = yy + 180;
		var r = 50;
		for(var i = 0; i < 2; i++){
			var cx = xx + 120 + 120*i;
			draw_set_color(c_white)
			draw_circle(cx, cy, r, false)
			
			current_angles[i] = rotateTowards(
				current_angles[i], 
				point_direction(cx, cy, mouse_x, mouse_y),
				5
			)
			
			var pupil_r = 20;
			var pupil_x = cx+lengthdir_x(r-pupil_r-10, current_angles[i])
			var pupil_y = cy+lengthdir_y(r-pupil_r-10, current_angles[i])
			draw_set_color(c_teal)
			draw_circle(pupil_x, pupil_y, pupil_r, false);
			
			draw_set_color(c_black)
			draw_circle(pupil_x, pupil_y, 5, false);
		}
		break;
	case modulo:
		draw_text(xx+30, yy+50, "modulus vs modulo")
		draw_text(xx+30, yy+90, concat("6 modulus 5 = ", 6%5))
		draw_text(xx+30, yy+110, concat("6 modulo 5 = ", modulo(6, 5)))
		draw_text(xx+30, yy+130, concat("-6 modulus 5 = ", (-6)%5))
		draw_text(xx+30, yy+150, concat("-6 modulo 5 = ", modulo(-6, 5)))
		break;
	case colorLerp:
		var cam_t = camX() / max_cam_x
		
		draw_set_halign(fa_center)
		draw_set_valign(fa_center)

		draw_set_color(colorLerp(c_blue, c_yellow, cam_t, true))
		draw_rectangle(xx + 40, yy + 60, xx + 320, yy + 160, false)
		draw_set_color(c_white)
		draw_text(xx + 180, yy + 110, "RGB")
		
		draw_set_color(colorLerp(c_blue, c_yellow, cam_t, false))
		draw_rectangle(xx + 40, yy + 190, xx + 320, yy + 290, false)
		draw_set_color(c_white)
		draw_text(xx + 180, yy + 240, "HSV")
		break;
	case "cam functions":
		var funcs = [camX, camY, camW, camH, camL, camR, camT, camB]
		for(var i = 0; i < array_length_1d(funcs); i++){
			draw_text(xx + 50, yy + 70+(i*20), concat(
				script_get_name(funcs[i]), 
				"(): ", 
				script_execute(funcs[i]))
			);	
		}
		break;
	case "pathAngle + circleArray":
		var path_angle = pathAngle(pathAngleTest, path_pos)
		var path_x = path_get_x(pathAngleTest, path_pos)
		var path_y = path_get_y(pathAngleTest, path_pos)
		var l = 20;
		draw_arrow(
			xx + path_x, 
			yy + path_y,
			xx + path_x + lengthdir_x(l, path_angle),
			yy + path_y + lengthdir_y(l, path_angle),
			l
		)
		draw_text(xx + 30, yy + 70, concat("path_angle:", path_angle))
		
		//draw pts
		circleArrayAdd(path_pts, [xx + path_x, yy + path_y]);
		for(var i = 0; i < circleArrayLength(path_pts); i++){
			var pt = circleArrayGet(path_pts, i);
			draw_set_alpha(i / circleArrayLength(path_pts))
			draw_circle(pt[0], pt[1], 2, false);
		}
		break;
	case chooseWeighted:
		var rr, ww;
		for(var j = 0; j < 6; j++){
			rr[j] = 0;
			ww[j] = 0
		}
		repeat(100){
			rr[ choose(0, 1, 2, 3, 4, 5) ] ++
			ww[ chooseWeighted(1, 1, 1, 1, 3, 1)] ++
		}
		
		draw_text(xx+10, yy+70, "100x choose")
		draw_text(xx+170, yy+70, "100x choose weighted")
		for(var j = 0; j < 2; j++){
			var xx2 = xx+10 + j*180
			var yy2 = yy+90
			draw_line(xx2, yy2, xx2, yy2+160);
			draw_line(xx2, yy2+160, xx2+160, yy2+160);
			for(var k = 0; k < 6; k++){
				var c = (j == 0)? rr[k] : ww[k];
				draw_rectangle(
					xx2+10+20*k, yy2+160-c*3,
					xx2+10+20*k+18, yy2+160, 
					false
				)		
			}
		}
		break;
	case randomGaussian:
		for(var j = 0; j < 4; j++){
			var xx2 = xx+10 + (j%2)*180
			var yy2 = yy+50 + (j div 2)*150
			var box_size = 130;
			draw_text(xx2, yy2-20, concat("order: ", j+1))
			draw_line(xx2, yy2, xx2, yy2+box_size);
			draw_line(xx2, yy2+box_size, xx2+box_size, yy2+box_size);
			draw_line(xx2, yy2, xx2+box_size, yy2);
			draw_line(xx2+box_size, yy2, xx2+box_size, yy2+box_size);
			repeat(100){
				var rx = randomGaussian(j+1);
				var ry = randomGaussian(j+1);
				draw_circle(
					xx2+rx*box_size, yy2+ry*box_size,
					2, false
				)
			}
		}
		break;
	case stringSplit:
		var str = "this is a test"
		draw_text(xx+30, yy+50, concat(
			"input:\n",
			str,
			"\n\noutput (split on space):\n", 
			stringSplit(str, " "),
		))
		break;
	case join:
		var arr = ["this", "is", "a", "test"]
		draw_text(xx+30, yy+50, concat(
			"input:\n",
			arr,
			"\n\noutput (join with space):\n", 
			join(" ", arr),
		))
		break;
	}
}