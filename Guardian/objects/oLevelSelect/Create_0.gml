var levels = [
	rm_game,
	rm_game,
	rm_game,
	rm_game,
]

enabled = false
if(!enabled) y-=room_height

var num_columns = 3
var num_rows = 3
var gap = 15

draw_set_font(fBigFont)
var title_offset = string_height("A")

var button_width = (sprite_width - gap*(num_columns-1))/num_columns
var button_height = (sprite_height - gap*(num_rows-1) - title_offset)/num_rows

for(var i = 0; i < num_rows; i++){
	for(var j = 0; j < num_columns; j++){
		if((i*num_rows + j) > array_length_1d(levels)) continue
		
		var xx = j*(button_width+gap)
		var yy = title_offset+i*(button_height+gap)
		with(addInputClickable(
			"",
			xx/image_xscale, yy/image_yscale, (xx+button_width)/image_xscale, (yy+button_height)/image_yscale,
			oTextButton, ANCHOR.screen_object,
			oLevelSelect
		)){
			if((i*num_rows + j) == array_length_1d(levels)){
				text = "BACK"
				script = buttonToggleLevelSelect
			}else{
				text = i*num_rows + j + 1
				script = buttonPlayLevel
				script_args = [levels[i*num_rows + j]]
			}
		}
	}
}

var fade_elems = layer_get_all_elements(layer_get_id("Fade"))
fade_elem = fade_elems[0]
start_alpha = layer_background_get_alpha(fade_elem)