/// @desc This script checks if the window was resized, and updates the application_surface/gui accordingly
/// @param [policy] map w/ the adjustment policy

var policy = (argument_count > 0)? argument[0] : undefined;

// default corresponds to 4:3 displays (like ipads)
var min_ratio = structGetOrDefault(policy, "min_ratio", 1.34)
// default coreesponds to the iphone x, the widest phone I'm aware of
var max_ratio = structGetOrDefault(policy, "max_ratio", 2.17)
// script to callback in order to perform specific camera dimension size update
var camera_update_script = structGetOrDefault(policy, "camera_update_script", undefined)
// if camera_update_script isn't specified, then we'll start with base dimensions 
//		and stretch verically or horizontally to match window ratio
// Also note that if there's any adjustment to the gameplay camera (maybe you're doing a zoom?) adjust the base numbers accordingly
var base_cam_width = structGetOrDefault(policy, "base_cam_width", 1280);
var base_cam_height = structGetOrDefault(policy, "base_cam_height", 720);
// use this if you want the gameplay to have extra scaling (the gui will just be calculated based on the base sizes)
var cam_scale = structGetOrDefault(policy, "cam_scale", 1);
var force = structGetOrDefault(policy, "force", false);

var ww = window_get_width();
var wh = window_get_height();

// NOTE: there's an assumption here, that you'll want the camera ratio to match the window ratio
// i guess it's not true for everyone, but it is true for 99.99% of people
var window_was_resized = window_has_focus() && round(100*camW()/camH()) != round(100*ww/wh);

if(!window_was_resized && !force) exit;

var ratio =  ww / wh;

var new_ratio = clamp(ratio, min_ratio, max_ratio);

// if the ratio was clamped, then adjust the window size accordingly
if(abs(new_ratio - ratio) > .01){
	// arbitarily chose to maintain perimiter for the clamping scenario
	var perimeter = (ww + wh) * 2;
	var center_x = window_get_x() + ww/2
	var top_y = window_get_y()
	
	wh = round(perimeter / (2 * (new_ratio + 1)))
	ww = round(wh * new_ratio);
	
	window_set_size(ww, wh)
	window_set_position(center_x-ww/2, top_y)
}

if(camera_update_script != undefined){
	script_execute(camera_update_script)	
}else{
	if((ww / base_cam_width) < (wh / base_cam_height)){
		camSize(base_cam_width*cam_scale, round(base_cam_width*wh/ww)*cam_scale)
	}else{
		camSize(round(base_cam_height*ww/wh*cam_scale), base_cam_height*cam_scale)
	}
}

//https://www.yoyogames.com/blog/66/scaling-for-devices-part-2-the-game-view
display_set_gui_size(camW()/cam_scale, camH()/cam_scale);
surface_resize(application_surface, camW()/cam_scale, camH()/cam_scale);