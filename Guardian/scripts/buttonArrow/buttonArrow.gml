with(preview){
	index += sign(other.image_yscale)	
	var size = (is_sprite)? 4 : 26
	while(index < 0) index += size
	index %= size
}
